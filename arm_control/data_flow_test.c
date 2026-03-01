///home/zrz0517/llvm-arm-cross/llvm-project-16.0.0/build/bin/clang  --target=arm-linux-gnueabihf  -Wall -g  -O0 data_flow_test.c -o data_flow_test_arm 
///home/zrz0517/TEE/optee-v3.4/toolchains/aarch32/bin/arm-linux-gnueabihf-objdump -D data_flow_test_arm > data_flow_test_arm.dump
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>   // usleep
#include <stdint.h>
#include <ctype.h>

/* Declare gets for older/compatibility usage (deprecated in C99, removed in C11) */
char *gets(char *s);

#define LOOPER_SLEEP_TIMER 100000  // microseconds (0.1s)
#define PERIPHERAL_INPUT_SIZE 1
#define CMD_PARAM_SIZE 1

/* simplified command structure */
typedef struct {
    int p_size;             // size of param
    int op;                 // operation id
    char param[CMD_PARAM_SIZE]; // parameter buffer
} cmd_t;
//static cmd_t __attribute__((annotate("nova_sensitive_var"))) cmd;
/* forward declarations */
int read_command(cmd_t *cmd);               // true if a command available
void get_input();                   // returns status (>=0) or -1 on error
int status_OK(int st);                      // returns non-zero if status OK
int (*get_op_func(int op))(int, char*);    // returns pointer to operation function

/* Example operation: move arm */
int op_move_arm(int n, char *param) {
    printf("[op_move_arm] called with n=%d, param=\"%s\"\n", n, param ? param : "(null)");
    /* In real code, do the movement here. */
    return 0;
}

/* A trivial dispatcher that maps op id -> function pointer */
int (*get_op_func(int op))(int, char*) {
    (void)op;
    /* For demo, any op == 1 -> op_move_arm, otherwise also use op_move_arm */
    return &op_move_arm;
}

/* status_OK: treat any non-negative status as OK */
int status_OK(int st) {
    return st >= 0;
}

void  read_char_from_file(const char* filename, char* buffer, size_t buffer_size)
{
    
    FILE* file = fopen(filename, "rb");
    
    // 读取数据，确保不超过缓冲区大小
    size_t bytes_read = fread(buffer, sizeof(char), buffer_size - 1, file);
    printf("Read %zu bytes from %s\n", bytes_read, filename);
    // 添加字符串终止符
    buffer[0] = '\0';
    
    fclose(file);
    return ;
}
void get_input() {
    //printf("Simulated peripheral: enter input (empty line -> status -1): ");
    char  peripheral_input[PERIPHERAL_INPUT_SIZE];
    read_char_from_file("./peripheral_input.txt", peripheral_input, 1000);
    //gets(peripheral_input);
    return;
}

/* read_command: interactive toy parser
   returns 1 if a command was read and populated in *cmd,
   returns 0 if quit/EOF (no command) */
int read_command(cmd_t *cmd) {
    char line[256];
    printf("Enter command (e.g. \"move 42\" or \"quit\"): ");
    if (!fgets(line, sizeof(line), stdin)) {
        return 0; // EOF
    }

    /* remove trailing newline */
    size_t L = strlen(line);
    if (L > 0 && line[L-1] == '\n') line[--L] = '\0';

    /* trim leading spaces */
    char *p = line;
    while (*p && isspace((unsigned char)*p)) ++p;

    if (strncmp(p, "quit", 4) == 0) {
        cmd->op = 0;
        return 0;
    }

    /* parse "move <param>" or single token */
    if (strncmp(p, "move", 4) == 0) {
        p += 4;
        while (*p && isspace((unsigned char)*p)) ++p;
        cmd->op = 1;
        printf("Parsed move command.\n");
        if (*p == '\0') {
            /* no param given */
            cmd->p_size = 0;
            cmd->param[0] = '\0';
        } else {
            strncpy(cmd->param, p, CMD_PARAM_SIZE - 1);
            cmd->param[CMD_PARAM_SIZE - 1] = '\0';
            cmd->p_size = (int)strlen(cmd->param);
        }
        return 3;
    }

    /* unknown command: treat as a move with argument = token */
    strncpy(cmd->param, p, CMD_PARAM_SIZE - 1);
    cmd->param[CMD_PARAM_SIZE - 1] = '\0';
    cmd->op = 1;
    cmd->p_size = (int)strlen(cmd->param);
    return 3;
}

/* The main control loop (keeps your original structure, with a safe get_input) */
void main_looper(void) {
    volatile int dynamic_size = 4; 
    char force_fp_dummy[dynamic_size];
    force_fp_dummy[0] = 0; // 防止变量被“死代码消除”优化掉
    // Command from remote controller
    int st = 0;
    cmd_t __attribute__((annotate("nova_sensitive_var"))) cmd;

    // Pointer to operation function
    int (*op_func)(int, char*);
    // Input from peripheral sensor
    
    
    //cmd_t *cmd_p = &cmd;        // ← 试图“避免 PC-relative”
    /* For demo, we allow breaking the loop by entering "quit" at command prompt.
       In a real embedded system this would be a true infinite loop. */
    while (1) {
        if (st =read_command(&cmd)) {
            get_input(); // BUGGY! -- replaced by safe implementation above
            if (st>2) {
                // perform the operation
                // int i=cmd_p->op;
                op_func = get_op_func(cmd.op);
                // if (op_func) {
                    (*op_func)(cmd.p_size, cmd.param);
                // }
            } else {
                printf("get_input failed or returned bad status: %d\n", st);
            }
        } else {
            printf("No command read: exiting main_looper.\n");
            break;
        }
        usleep(LOOPER_SLEEP_TIMER);
    }
}

/* main to run the looper */
int __attribute__((annotate("critical function"))) main(void) {
    printf("Starting main_looper demo. Type commands in the prompts.\n");
    main_looper();
    printf("main_looper exited. Bye.\n");
    return 0;
}
