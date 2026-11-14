\# Ticket 2 — Office Specification



\*\*To: Daniyar K. (Director)\*\*



Regarding your assumption that we should buy four identical machines: this approach is wrong and I strongly advise against it. The workload for a designer rendering 3D graphics is completely different from an accountant working in Excel. Buying four identical PCs would mean the designer suffers from severe performance bottlenecks, while the company wastes money over-speccing the accountant's machine. By allocating the 3,000,000 KZT budget according to actual needs, we built specialized machines for each role while staying comfortably under budget (Total: \~2,603,000 KZT).



\## Answers to Questions



\*\*1. Which of the four machines will you upgrade first, eighteen months from now, and why?\*\*

The Designer's machine. Creative software (like Adobe CC or 3D renderers) and asset sizes grow rapidly in their hardware requirements. While an RTX 4070 is powerful now, 12GB of VRAM might become a bottleneck for complex 4K/8K rendering in 18 months, requiring a GPU upgrade to keep export times low.



\*\*2. Price the same four as pre-built machines from a vendor. What does the company gain and what does it lose by not building them?\*\*

\* \*\*Gain:\*\* A single, comprehensive warranty and support for the entire machine. If a pre-built PC breaks, IT sends the whole box back instead of spending hours diagnosing which specific part (RAM, Motherboard, CPU) failed. It also saves initial assembly time.

\* \*\*Lose:\*\* Cost efficiency and component quality. Pre-builts usually cost 15-20% more for the same core specs (CPU/GPU). To increase margins, vendors almost always use the cheapest possible components for parts the buyer doesn't look at closely (such as low-tier power supplies, slow RAM timings, or motherboards with poor cooling). 



\*\*3. One of these four people will complain about performance within a month. Which one, and about what?\*\*

The Web Developer. They have 64GB of RAM and a powerful CPU, but only 1TB of SSD storage. Local Docker containers, multiple heavy IDEs, heavy `node\_modules` folders, and local database instances will eat up 1TB very quickly. They will complain about running out of disk space.

