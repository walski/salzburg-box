# Arecipe

An app to practice scaling patterns in Rails.

## Setup

```
$ bundle install
$ bundle exec rake db:setup
```

This setup might take a while.

## Exercise

Your job will be to scale this app and document your work along the road. Please read carefully through this document as it has some important instructions further down. Please read it all before you go to work :)

Your results must be submitted by June 24th - 23:59h.

Here you go, step by step:

### 1. Analyze the Existing App

Start with an analysis of the current state of the app. You should cover the front page (``/``), the user pages (``/users/123``) and the recipe pages (``/recipes/123``). Make sure to stay consistent with your test setup during all off the initial analysis. Please test the pages for multiple users and recipes. Do not forget to check this with and without a logged in user session (might help to do this for different logged in users, too).

For those tests feel free to choose any application server, Ruby version and benchmarking tool you want. But for your initial analysis stick to same one.

Outcome of this analysis is an overview of the performance of the app under different load conditions (what happens for x, y, z concurrent users).

State a clear goal of your scaling efforts. You need to know when you are done. The goal can be relative to your starting point:

> Improve front page load times by x%. Improve user page load times by y%...

or they are relative to your iterations:

> Improve the front page load times until further iterations do not improve load times by more than 10%.

No right or wrong here, just make sure you have that goal written down.

### 2. Documenting Results

All of your results should be captured in the ``analysis`` folder within this app. Do not worry about formats as long as an educated guess tells you that I will be able to read them. HTML, Markdown, plain text, PDF, whatever works best for you. Bonus points for some graphs.

### 3. Scaling Iterations

From your initial results go ahead and find the best possible setup to run the app. Implement, tweak and change:

* app servers
* ruby versions
* caching (in all it's varieties)
* different data-stores (other DBs? Redis?)

Make sure to change one thing at a time and re-iterate your tests to see if things improve. Do not test **every** possible setup. Make smart decissions backed by your data and **document why you have choosen your next iteration step**. Please document each of your iterations. Each iteration must have a clear goal, description of any changes to the setup and a clear roundup whether you could meet your goals. Back each iteration by benchmarks!

Please do **not** change any performance related code. The app is very wasteful with resource on purpose. Rule of thumb: If you want to use something to make that app faster that comes with Rails (eg. counter caches, joins, etc) do not do it. If you want to use advanced scaling techniques (Redis backed like-system anyone?) DO IT!

During all your iterations please note that the app contains some random elements. It is ok for caching attempts to limit the randomness by a certain extent (think: there will not be a different recipe shown on each request but every 10 minutes). Do not cache those forever.

Please make sure that all workflows stay intact (eg. login/logout).

### 4. Summary

Write a summary of your scaling efforts. Outline the improvements you have made. Describe what did work but also what did not or what caused unexpected problems. Show a path what could be done in the future to improve performance even more. Reflect on your preliminary set scaling goal.

## Submission Of Results

Please make one git commit for each iteration. This includes the documentation of this iteration. After you have finished please submit the repository back to me as a GitHub pull request. Please not that pull requests are public. I kindly ask you to do the pull request on the last day of your dead-line only. If you want to submit your work earlier please zip the whole ``arecipe`` folder (including the ``.git`` stuff) and send it my way via eMail: info@thorbenschroeder.de

Your results must be submitted by June 24th - 23:59h.

## Grading

This is not a scaling competition. Cool if you can improve the app's performance but that is not the point of this excercise. I will grade:

* **DOCUMENTATION**
  * Can I understand where you have started?
  * Can I understand what you have done?
  * Can I understand if that has worked?
  * Can I understand why you choose your next step?
* How broken is the app? (Hopefully: not at all!)
* Is you choice of scaling techniques in line with what makes sense
* Is there any obvoious point of performance improvement that you did not cover?

## Questions

Please ask. Just shoot me an eMail: info@thorbenschroeder.de