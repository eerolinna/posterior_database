## Python versions

Currently only python 3.6+ is supported. Python 3.5+ support can be added if needed. We don't plan to support python 2.

## Installation

Currently only local install is supported. From the main directory of this project run
```bash
pip install python/posterior_db
```

Installing from git url will be supported soon. Publishing the package to PyPI will also happen at some point.

## Using the posterior database from python

The included database contains convenience functions to access data, model code and information for individual posteriors.

First we create the posterior database to use, here the cloned posterior database.

```python
>>> from posterior_db import PosteriorDatabase
>>> import os
>>> my_pdb = PosteriorDatabase(os.getcwd())
```

The above code requires that your working directory is in the main folder of your copy
of this project. Alternatively, you can specify the path to the folder directly. To list the posteriors available, use `posterior_names`.

```python
>>> pos = my_pdb.posterior_names()
>>> pos[:5]

['roaches-roaches_negbin',
 'syn_gmK2D1n200-gmm_diagonal_nonordered',
 'radon_mn-radon_variable_intercept_centered',
 'syn_gmK3D2n300-gmm_nonordered',
 'radon-radon_hierarchical_intercept_centered']

```

In the same fashion, we can list data and models included in the database as

```python
>>> mn = my_pdb.model_names()
>>> mn[:5]

['gmm_diagonal_nonordered',
 'radon_pool',
 'radon_partial_pool_noncentered',
 'blr',
 'radon_hierarchical_intercept_noncentered']


>>> dn = my_pdb.dataset_names()
>>> dn[:5]

['radon_mn',
 'wells_centered',
 'radon',
 'wells_centered_educ4_interact',
 'wells_centered_educ4']


```

The posterior's name is made up of the data and model fitted
to the data. Together, these two uniquely define a posterior distribution.
To access a posterior object we can use the posterior name.

```python
>>> po = my_pdb.posterior("eight_schools-eight_schools_centered")
```

From the posterior we can access the dataset and the model

```python
>>> mo = po.model
>>> da = po.dataset
```
We can access the same model and dataset also directly from the posterior database
```python
>>> mo = my_pdb.model("8_schools_centered")
>>> da = my_pdb.dataset("8_schools")
```

From the model we can access model code and information about the model

```python
>>> mo.code("stan")
data {
  int <lower=0> J; // number of schools
  real y[J]; // estimated treatment
  real<lower=0> sigma[J]; // std of estimated effect
}
parameters {
  real theta[J]; // treatment effect in school j
  real mu; // hyper-parameter of mean
  real<lower=0> tau; // hyper-parameter of sdv
}
model {
  tau ~ cauchy(0, 5); // a non-informative prior
  theta ~ normal(mu, tau);
  y ~ normal(theta , sigma);
  mu ~ normal(0, 5);
}
>>> mo.code_file("stan")
'/home/eero/posterior_database/content/models/stan/eight_schools_centered.stan'
>>> mo.information
{'keywords': ['bda3_example', 'hiearchical'],
 'description': 'A centered hiearchical model for the 8 schools example of Rubin (1981)',
 'urls': ['http://www.stat.columbia.edu/~gelman/arm/examples/schools'],
 'title': 'A centered hiearchical model for 8 schools',
 'references': ['rubin1981estimation', 'gelman2013bayesian'],
 'added_by': 'Mans Magnusson',
 'added_date': '2019-08-12'}
```
Note that the references are referencing to BibTeX items that can be found in `content/references/references.bib`.

For convenience there is also a shortcut `po.code("stan")` that is the same as `po.model.code("stan")`.

From the dataset we can access the actual data and information about it

```python
>>> da.data()

{'J': 8,
 'y': [28, 8, -3, 7, -1, 1, 18, 12],
 'sigma': [15, 10, 16, 11, 9, 11, 10, 18]}

>>> da.data_file()
'/tmp/tmpx16edu0w'

>>> da.information
{'keywords': ['bda3_example'],
 'description': 'A study for the Educational Testing Service to analyze the effects of\nspecial coaching programs on test scores. See Gelman et. al. (2014), Section 5.5 for details.',
 'urls': ['http://www.stat.columbia.edu/~gelman/arm/examples/schools'],
 'title': 'The 8 schools dataset of Rubin (1981)',
 'references': ['rubin1981estimation', 'gelman2013bayesian'],
 'data_file': 'content/datasets/data/eight_schools.json',
 'added_by': 'Mans Magnusson',
 'added_date': '2019-08-12'}
```
For convenience there is a shortcut `po.data()` that is the same as `po.dataset.data()`.

To access gold standard posterior draws we can use `gold_standard` as follows (NOTE not implemented yet).

```python
> gs = po.gold_standard()

NOT_IMPLEMENTED_YET
```
