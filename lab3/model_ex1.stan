generated quantities {
  int<lower=0> N = 50;             // number of trials
  int<lower=0,upper=N> y;          // number of successes
  real<lower=0,upper=1> p;         // probability of allergic reaction

  p = beta_rng(2, 8);              // prior distribution for p, using a beta distribution with a=2 and b=8
  y = binomial_rng(N, p);          // sample from binomial distribution with N trials and probability p
}


