Mobile Payment Adoption
=======================

An analysis of mobile payment adoption based on data from the 2009 Survey of Consumer Payment Choice (SCPC), in which I attempt to replicate, using common Python libraries, a 2012 analysis I originally performed using Stata_ statistical software.

.. image:: https://travis-ci.com/sedelmeyer/mobile-payment-adoption.svg?branch=master
    :target: https://travis-ci.com/sedelmeyer/mobile-payment-adoption

.. contents:: Contents
  :local:
  :depth: 1
  :backlinks: none

Summary
-------

For this analysis, I attempt to replicate and build upon a set of original statistical findings I authored in 2012 while in graduate school, titled "`Conditions for Consumer Acceptance of Mobile Payment Methods In the United States`_." My original 2012 analysis was conducted using Stata version 11, the code for which has been commited to this repository as `SCPC2009_stata.do`_.

Tools and methods
^^^^^^^^^^^^^^^^^
Here I use common Python libraries to conduct my replication and explore methods related to:

* Logistic regression in rare events data
* Bootstrapping of AUC metrics and receiver operator characteristic (ROC) curves

Please excuse errors and questionable choices regarding factor selection and interpretation. My original analysis was produced as a class-based research project and was author quite some time ago.

Data Source
^^^^^^^^^^^
The data source used for the original analysis is the Federal Reserve Bank of Boston's 2009 Survey of Consumer Payment Choice.

While it appears that the original .dta file is no longer available on the BOS FED's website, the original source URL for that data was: http://www.bos.frb.org/economic/cprc/SCPC/index.htm


Analysis and findings
---------------------

The analysis and findings associated with this project can be found here:

https://sedelmeyer.github.io/mobile-payment-adoption


Source code documentation
-------------------------

Documentation for the python modules built specifically for this analysis (i.e. modules located in the ``./src/`` directory of this project) can be found here:

https://sedelmeyer.github.io/mobile-payment-adoption/modules.html

.. _replication:

Replicating this analysis
-------------------------

Unfortunately, because the original 2009 SCPC dataset is no longer available online and because its copyright prevents me from providing it alongside this analysis, it will not be possible for others to fully replicate this analysis. I do however still provide details below concerning the use of this repository and associated code so others can build upon the methods if they so choose.

.. contents:: In this section
  :local:
  :backlinks: none

.. todo::

    * Below is a placeholder template containing typical steps required to replicate a PyData project.
    * Content must be added to each section, outlining requirements and explaining how to replicate the analysis locally

0. Ensure system requirements are met
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Clone this repository locally
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

2. Install the required environment using Pipenv
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3. Run the data pipeline and analysis workflows locally
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4. Explore the associated Jupyter notebooks included with this project
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. _development:

Adding to this project
----------------------

If you'd like to build off of this project to explore additional methods or to practice your own data science and development skills, below are some important notes regarding the configuration of this project.

.. contents:: In this section
  :local:
  :backlinks: none

.. todo::

    * Below are placeholder sections for explaining important characteristics of this project's configuration.
    * This section should contain all details required for someone else to easily begin adding additional development and analyses to this project.

Project repository directory structure, design, and usage
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Python package configuration and associated workflows
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Testing
^^^^^^^

Version control and git workflow
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Documentation using Sphinx and reStructuredText
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. _issues:

Questions or issues related to this project
-------------------------------------------

.. todo::

    * Add details on the best method for others to reach you regarding questions they might have or issues they identify related to this project.


.. _sources:

Sources and additional resources
--------------------------------

Gary King and Langche Zeng. 2001. “Logistic Regression in Rare Events Data.” Political Analysis, 9, Pp. 137–163: https://gking.harvard.edu/files/abs/0s-abs.shtml

Michael Tomz, Gary King, & Langche Zeng. "ReLogit: Rare Events Logistic Regression." Journal of Statistical Software [Online], 8.2 (2003): 1 - 27. Web. 9 Sep. 2017: https://www.jstatsoft.org/article/view/v008i02

Federal Reserve Bank of Boston, Survey of Consumer Payment Choice: https://www.bostonfed.org/publications/survey-of-consumer-payment-choice.aspx


.. _Stata: https://www.stata.com/
.. _Conditions for Consumer Acceptance of Mobile Payment Methods In the United States: ./reports/sedelmeyer-mobile-payment-20120503.pdf
.. _SCPC2009_stata.do: ./reports/SCPC2009_stata.do
