---
title: Background
---

The overall theme of the RAWFP project is improving productivity in software
development through domain-specific languages embedded in functional languages.
Using a functional programming language as a host for domain-specific
collections of types, primitives, combinators and control structures —
effectively the definition of a language specific to each domain — is described
and motivated in our original project proposal. The proposal also illustrates
what dramatic productivity and quality increases that can be expected from the
application of functional programming, provided that the important aspect of
resource control can be mastered. This is precisely the argument that leads to
the idea of embedding domain-specific knowledge as a language of its own inside
a functional host,


In 2010, Swedsoft (an industrial network of large Swedish software developers)
called for an order of magnitude improvement in software development
productivity over the next decade, if Sweden is to remain competitive.
Coincidentally, an improvement of roughly an order of magnitude in productivity
over conventional programming languages is the claim that has been made for
functional programming since the 1980s. In the early days, that claim was based
on the brevity of functional programs—the implementation of QuickSort is two
lines in Haskell, but twenty lines in Java—and the well-known observation that
developers produce approximately the same number of lines of code per day,
regardless of programming language. Today, evidence of improved productivity is
much more direct.


Functional programming is seeing rapid growth in industry today. Ericsson were
pioneers in the area, designing Erlang around 1990, and using it for the first
time in a large product in the mid 1990s— the AXD 301 ATM switch, with around
1,500,000 lines of Erlang code. Writing about the outcome of that project,
Wiger estimated a 4 to 10 times productivity improvement over traditional
methods [Wiger et al., 2002], supporting the earlier claims. Since then, many
other companies worldwide have used the technology to attain business success
via higher productivity, notable Swedish examples including BlueTail, sold less
than 18 months after start-up for $152 million, and Klarna, which offers
invoicing services to web shops and has grown to 350 people in just five years.
In recent years Microsoft have adopted functional programming features in their
.NET languages C# and Visual Basic, and released a functional programming
language of their own, F#, as part of Visual Studio 2010. On the JVM, Scala and
Clojure offer functional programming with smooth interoperability with Java,
and high profile applications have appeared—such as Twitter’s back-end
processing, which is mostly done in Scala using a concurrency library inspired
by Erlang. A major motivation for all this growth is the improved productivity
that functional programming brings.


Problem solved? Unfortunately, no—it would be naive to suggest that the Swedish
software industry can solve all its problems just by adopting functional
programming. Even in the AXD 301, only part of the system is programmed in
Erlang—the “control plane”, which sets up and tears down calls, and responds to
protocol requests, is nicely implemented in Erlang, but the “data plane”, which
actually transmits data streams at gigabytes per second, is programmed in C and
C++ to meet extreme performance demands. In the baseband processing of a radio
base station, the signal processing is done by C code full of compiler pragmas
and tailored exquisitely to the hardware. In ABB’s robot control software, and
SAAB’s avionics, the software must meet hard real-time deadlines. Functional
programming languages such as Erlang cannot meet these demands, and so are not
yet applicable in these domains.


Does this mean that large parts of the Swedish software industry can never use
functional programming? Fortunately, no—there is a way to cut the Gordian knot,
and attain the  productivity benefits of writing functional programs, without
incurring the costs of running them. The trick is to use functional programming
to provide a domain specific language (DSL) for the application domain
concerned.



