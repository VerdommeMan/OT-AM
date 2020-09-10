# Benchmarks
Here i compare the benchmarks between OT&AM, Zone+ and Region3. And each benchmark will have its rbxl file stored in the folder [benchmarks](https://github.com/VerdommeMan/OT-AM/tree/master/Benchmarks). So that you can easily see the difference for yourself.

!!! note "If you run these benchmarks you will have different results but you should see a similar trend"

??? note "I didnt include RAM in these benchmarks"
    There were big jumps in the RAM usages, even when there are no scripts running, any measurement would give a wrong impression.
    If you do want to see the RAM usages, i suggest that you download one of the benchmarks.

??? info "general info about benchmarks"
    - all benchmarks are done with localserver + 1 player
    - all benchmarks are done on the server
    - with coreloop i mean, one loop over areas and see if it found something, coreloop is basically the function/code that gets called each heartbeat
    - I used AV7 with OT&AM while AV2 is considerable faster (since AV7 will be mostly used anyway)
    - i made a small custom module to track the coreloop of Zone+ and Region3
    - Due to the fact that most Areas are not axis aligned means that Region3 will be practically misaligned for each area but since we are just     comparing performance it doesnt matter.
    - To run the benchmarks yourself, just download the rbxl file, open it with studio and enable a setup from SSS and Play, and wait for the comment in the output, the benchmarks have been setup to make it very easy to run them yourself, btw dont run two setups at the same time

## Benchmarks OT&AM/Zone+/Region3

### Benchmark of small area/parts

??? info "STATS"
    - Areas: 5
    - Area size AVG: 50, 50, 50
    - AVG parts per Area: 287
    - Heartbeat: 60
    - The amount of iterations for AVG coreloop: 500 
    - Filename: "LowBenchmark OT&AM vs Zone+ vs Region3.rbxl"

=== "OT&AM"
    - how long one coreloop took: 1.7629400826991e-05 s

=== "Zone+"
    - how long one coreloop took: 0.00040586279999843 s (x23 times OT&AM)

=== "Region3"
    - how long one coreloop took: 0.0011700086001074 s  (66x times OT&AM)


### Benchmark of medium area and medium amount of parts

### Benchmark of huge area and huge amount of parts

!!! help "If you have any better way to measure/compare between these methods please let me know"

## Benchmark of PiP of AV2 vs AV7 vs RR3

