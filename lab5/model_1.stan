generated quantities {
    real N = normal_rng(5, 2);
    real alpha = normal_rng(0.5,0.01);
    real theta = normal_rng(0.6,0.1);
    int  y = poisson_rng(exp(alpha + theta*N));
} 