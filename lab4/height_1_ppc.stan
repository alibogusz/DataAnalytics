generated quantities {
    real mu;
    real<lower=0> sigma;
    real height;

    mu = normal_rng(172, 10);
    sigma = cauchy_rng(0, 15);
    height = normal_rng(mu, sigma);
}