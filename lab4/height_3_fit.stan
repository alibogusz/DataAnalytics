data {
  int<lower=0> N;
  real<lower=0> heights[N];
  real weights[N];
}

parameters {
  real alpha;
  real beta;
  real<lower=0> sigma;
  real<lower=0> gamma;
}

transformed parameters {
  real mu[N];
  mu = alpha + beta * weights + gamma * pow(weights, 2);
}

model {
  alpha ~ normal(178, 20);
  beta ~ normal(0, 10);
  gamma ~ normal(0, 10);
  sigma ~ cauchy(0, 5);

  heights ~ normal(mu, sigma);
}
