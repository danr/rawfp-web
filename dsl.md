---
title: DSLs
---

DSLs have become popular recently [Fowler, 2010], as a way to improve
productivity by providing a language tailored to the task in hand, while
assuring performance by exploiting domain specific optimizations. Functional
programmers advocate domain specific embedded languages (DSELs), which provide
a DSL via a library in a host language [Hudak, 1996]. This is partly just a
shift in perspective— we view the API of the library as the constructs of a
DSL—but with a sufficiently expressive host language, and careful design of the
API, then the DSLs that result can be very attractive indeed. The great
advantage of the approach is that a DSEL inherits the tool chain of its host
language, the “look and feel” (so it is familiar to host language devel-
opers), and generic features such as modules, interfaces, abstract data types,
or higher-order functions. Moreover, the DSEL implementation is very
“lightweight”—the DSEL designer can add features just by implementing a new
function in the library, and can easily move functionality between the DSEL
library and its clients. The ease of experimentation with such a DSEL helps
implementors fine tune the design, and enables (some) end-users to customize
the implementation with domain specific optimizations.

A DSEL can either implement the DSL’s features directly in the host
language—or, it can generate code from the DSEL program in any other target
language, a so-called domain specific embedded compiler. In the latter case,
the host language is used only at “compile time”; the developer can use the
full power of the host language to express the program, but at run-time, only
the target language need be executed—for example, Paradise [Augustsson et al.,
2008], a DSEL embedded in Haskell, generates Excel user interfaces to C++
algorithms for valuing financial contracts at Credit Suisse. (There is a clear
analogy with the “platform independent model” and “model compiler” used in the
model-driven development community.)

Of course, achieving this requires careful design of the DSEL, but in return we
gain the expressive power of functional programming, while retaining the fine
control of resources that is needed in so many industrial applications. We have
considerable experience of using Haskell as a host language in this way, to
implement DSELs such as Lava (for configuring Field Programmable Gate Arrays
[Bjesse et al., 1998]), Obsidian (for programming graphics processors), and
Feldspar (for baseband signal processing [Axelsson et al., 2010]).

To illustrate the potential of the approach, in one experiment at Ericsson,
Feldspar was used to implement part of the reference signal generation for
channel estimation in the LTE Advanced testbed. (LTE, or “Long Term Evolution”
is commonly referred to as 4G.) The Feldspar implementation could be structured
naturally as a series of cascading processing steps, matching well the domain
expert’s view of the problem. Not only that, it also generated C code that was
30% faster than the hand-coded reference model, because it permitted
optimization (in the form of removal of unnecessary data structures) between
the steps. It is this effect that we are striving for: high level descriptions
that match the thinking of the domain expert, leading to efficient generated
code.

The goal of this proposal is to develop domain specific embedded languages for
resource-aware functional programming, with associated end-to-end tool-chains,
that can deliver an order of magnitude improved productivity in two domains of
importance to Swedish industry:

* signal processing and low-level control in products such as radio base
  stations (Feldspar),
* real-time automotive software built around the AUTOSAR standard.

These areas have been chosen for their importance to Swedish software-intensive
industry and for the range of concrete research challenges they exhibit. The
Feldspar component builds on our very promising collaboration with Ericsson,
and will require architecture awareness to meet very high performance demands.
The automotive component builds on our collaboration with Quviq AB and Volvo,
and requires us to address the important area of real-time systems. Together,
these areas require support for awareness of time, memory, and architecture,
and so will force us to solve most of the problems that resource-aware
programmers face.



