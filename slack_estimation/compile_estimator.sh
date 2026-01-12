#TARGET_TRIPLE=aarch64-linux-gnu
TARGET_TRIPLE=x86_64-linux-gnu
clang++ -c  --target=$TARGET_TRIPLE $opdfi/slack_estimation/online_estimator.cpp -o $opdfi/slack_estimation/online_estimator.o
clang++ -c -flto --target=$TARGET_TRIPLE $opdfi/slack_estimation/online_estimator.cpp -o $opdfi/slack_estimation/online_estimator.bc