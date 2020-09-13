# Benchmarks
Here i compare the benchmarks between OT&AM, Zone+ and Region3. And each benchmark will have its rbxl file stored in the folder [benchmarks](https://github.com/VerdommeMan/OT-AM/tree/master/Benchmarks). So that you can easily benchmark it yourself.

!!! note "If you run these benchmarks you will have different results but you should see a similar trend"

??? note "I didnt include RAM in these benchmarks"
    There were big jumps in the RAM usages, even when there are no scripts running, any measurement would give a wrong impression.
    If you do want to see the RAM usages, i suggest that you download one of the benchmarks.

??? info "general info about benchmarks"
    - all benchmarks are done with localserver + 1 player
    - all benchmarks are done on the server
    - with coreloop i mean, one loop over areas and see if it found something, coreloop is basically the function/code that gets called each heartbeat
    - I made a small custom module to track the coreloop.
    - Due to the fact that most Areas are not axis aligned means that Region3 will be practically misaligned for each area but since we are just comparing performance it doesnt matter.
    - To run the benchmarks yourself, just download the rbxl file, open it with studio and enable a setup from SSS and run it, and then wait for the comment in the output, the benchmarks have been setup to make it very easy to run them yourself, btw dont run two setups at the same time.

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

??? info "STATS"
    - Areas: 20
    - Area size AVG: 100,100,100
    - AVG parts per Area: 1276
    - Heartbeat: 60
    - The amount of iterations for AVG coreloop: 500 
    - Filename: "MedBenchmark OT&AM vs Zone+ vs Region3.rbxl"

=== "OT&AM"
    - how long one coreloop took:  2.1793200023239e-05 s

=== "Zone+"
    - how long one coreloop took:  0.0066890208016848 s (307x times OT&AM)

=== "Region3"
    - how long one coreloop took:  0.014583717400208 s (669x times OT&AM) 

### Benchmark of large area and high amount of parts

??? info "STATS"
    - Areas: 100
    - Area size AVG: 250, 250, 250
    - AVG parts per Area: 3007
    - Heartbeat: 60
    - The amount of iterations for AVG coreloop: 500 
    - Filename: "LargeBenchmark OT&AM vs Zone+ vs Region3.rbxl"

=== "OT&AM"
    - how long one coreloop took: 0.00011771380019491 s 
    - 60 FPS 

=== "Zone+"
    - how long one coreloop took: 0.042149675987021 s (358x times OT&AM)
    - note: this average has been upscaled from 10 zones to 100, since more than 10 zones with this many parts gave `Script timeout: exhausted allowed execution time` error.

=== "Region3"
    - how long one coreloop took: 0.25659490280008 s (2180x times OT&AM) 
    - 4 FPS

!!! help "If you have any better way to measure/compare between these methods please let me know"

## Benchmark of PiP of AV2 vs AV7 vs RR3

??? info "STATS"
    - Iterations: 500
    - Filename: "BenchmarkRR3vsAV2vsAV7.rbxl"

=== "AV2"
    AVG: 4.02599980589e-07 s
=== "AV7"
    AVG: 4.2959998245351e-07 s
=== "RR3"
    AVG: 2.875599951949e-06 s