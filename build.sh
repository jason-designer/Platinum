#!/bin/bash

sbt 'test:runMain cpu.IFetchGen -td ./generated/ifetch'
sbt 'testOnly cpu.FullAdderTest -- -DwriteVcd=1'

sbt 'test:runMain cpu.MemoryGen -td ./generated/memory'
sbt 'testOnly cpu.MemoryTest -- -DwriteVcd=1'

sbt 'testOnly cpu.IFetchTest -- -DwriteVcd=1'

