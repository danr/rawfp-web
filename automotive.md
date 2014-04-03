---
title: Automotive
---

Automotive software systems are characterized by extensive distribution and
platform heterogeneity, yet their purpose is to provide a harmonized set of
functionalities that are fully embedded in, and inseparable from, the physical
vehicles on which they run. Concurrency is an inevitable aspect of such
embedded systems, as is the presence of hard real-time constraints and limited
hardware resources. Automotive systems are moreover typically developed in a
distributed fashion, with geographically separated teams working independently,
at different times, and often even within different enterprises. To improve
software interchangeability and collaboration among such entities, the
automotive industry has assembled around the AUTOSAR standard [ref].


AUTOSAR provides an open software component architecture with standardized
interfaces, a standard set of basic software functionalities, and a methodology
standard for the automotive software development process. The standard is also
supported by development tools from numerous vendors, including the common use
of Matlab/Simulink for modeling functional behavior.


Despite these achievements, however, automotive software development remains a
complex task.

  1. While Matlab/Simulink allows early simulation of individual functions,
     simulation and testing of arbitrary subsystems is inhibited until an
     AUTOSAR design has reached the stage where concrete and complete C code
     exists. Due to distributed development and complex system
     interdependencies, this constraint can lead to testing turnaround times
     that count in hours and even days.

  2. Because the AUTOSAR development process must resolve all hardware
     dependencies before any C code can be generated, an AUTOSAR design cannot
     be simulated in the abstract; that is, before ECU and task assignments
     have been made, communication protocols have been chosen, and various
     clock speeds have been fixed.

  3. The size of the AUTOSAR specification itself (~ 12 500 pages of pdf text
     and diagrams in version 4.1) naturally leads to challenges in interpreting
     its underlying semantics. The net effect is that an AUTOSAR engineer can
     only explore a design by looking at its behavior tied to a specific
     hardware and software platform, not readily predict the consequences of
     replacing that platform with some commercially attractive alternative.

The listed obstacles all contribute to premature design choices, vendor lock-in
effects, inefficient testing and increased development times[a]. They are also
detrimental to agile development principles, simply because testing of a single
subsystem requires so much of the final system implementation to be in place.


RAW FP seeks to address this problem space with a domain specific language that
faithfully captures the structure and semantics of AUTOSAR on the level of
software components (SWCs), including the functional behavior of runnables and
their run-time environment (RTE). Programs in this DSEL can express systems
with an arbitrary number of SWCs connected through the virtual function bus
(VFB), and they are directly executable without prior transformation to less
abstract representations. The automotive DSEL thus serves a dual purpose in
relation to AUTOSAR: as a testbench for early system simulation and
exploration, as well as a normative and platform-neutral formalization of the
AUTOSAR software components specification.


Our vision for the automotive DSEL is as a component fully integrated in
industry standard tool chains, supporting automatic translation to and from
established structural and behavioural formats such as AUTOSAR XML, ARText and
Matlab code. Simulation under selectable scheduling/timing assumptions is
available at the push of a button, and there is tight integration between the
simulator and the property-based testing framework of QuickCheck. Systems can
be tested in full or as isolated subcomponents, both before and after ECU
partitioning has been performed. In addition, the DSEL implementation will be
able to directly generate optimized AUTOSAR C code, utilizing proven
semantics-based code transformation techniques such as fusion.

