---
title: Telecom
---

The signal processing domain places high demands on software performance. These
demands force signal processing software to be written as low-level C or C++
code tailored to the hardware on which it is going to run. This low-level
programming style has several problems:

   (1) It makes it hard to reuse code on different hardware platforms;

   (2) it forces early design decisions (e.g.  regarding partitioning and data
   representation) that may turn out to be sub-optimal;

   (3) the big gap between an algorithm specification and its implementation
   makes development more time-consuming and makes it harder to verify
   functionality.


To make matters worse, signal processing software is much more than just plain
signal processing. A complete system (e.g. a base station) has to be
partitioned into separate sub-tasks (kernels), and these tasks must be
scheduled to run concurrently on the available processing units. Data has to be
communicated efficiently between the kernels within required time bounds. The
designer of such a system faces an endless number of decisions regarding how to
partition the system and where, when and how to process a given sub-problem –
and the design space is only increasing with the move towards more parallel and
heterogeneous architectures. In this setting, the problems of low-level
programming are exacerbated – in particular the problem with early design
decisions. Changing the structure of the system can easily require a major
rewrite of the code.


Our Feldspar DSL has come a long way towards high-level, platform-independent
signal processing code that can be compiled to efficient low-level C. In order
to reach a fully working system for signal processing software in industry,
there are several areas that must be tackled:


* Parallelism In order to meet the performance demands of today and of the
  future, one needs to be able to express and generate code that can be easily
  deployed on massively parallel hardware making full use of the available
  processing power.
* Sequential performance Although utilizing parallel hardware is important, it
  is equally important that the sequential code running in each thread is
  maximally efficient. This is especially challenging for DSLs based on a
  functional programming model, but our results from Feldspar are encouraging
  in this respect.
* Systems design At the system level, there is a burning need for high-level
  programming models that allow quick and easy design space exploration. This
  is needed to be able to find the optimal design for a given platform, but
  also to be able to easily port the software to a new platform. Feldspar
  allows this kind of exploration at the algorithmic level, and there is reason
  to believe that functional DSLs can achieve the same flexibility at the
  system level.
* Testing Functional programming encourages breaking algorithms up into small
  self-contained functions. For example, in Feldspar, helper functions can
  easily be introduced without paying the price of function calls or the need
  to create intermediate data structures. This often allows functional programs
  to be tested at a very fine level. However, a major challenge in testing
  numeric algorithms is to be able to correctly abstract away from rounding
  errors.
* Usability It is not enough for a high-level DSL to be useful in an ideal
  situation. One also has to take into account realistic factors such as:

     * DSL code must be able to coexist with legacy code, e.g. written in C. This
       involves being able to tailor the code generation to fit with existing
       interfaces.
     * DSL programs will contain bugs with respect to functional and
       non-functional requirements. There must be a way for users to debug and
       quickly find out the cause of a problem.


Our goal is a DSL that will be the quickest and easiest way to develop
high-performance signal processing software with a particular aim for
power-efficient massively parallel architectures (such as the Parallela[1]).
One of the key features of this DSL will be the ability to easily explore
different design choices and tailor the code for different situations. We don't
believe that smart compilers will be able to automatically generate efficient
code from high-level, platform-independent programs. Rather, we want to provide
programmers with a design exploration system in which the effects of various
choices can be rapidly evaluated.


To be concrete: In this envisioned system, structural changes that would take
man-months to do in C should be possible to do in a matter of minutes.

