#!/usr/bin/python

import resource
resource.setrlimit(resource.RLIMIT_NPROC, (20,20))

