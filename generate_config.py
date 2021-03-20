#!/usr/bin/env python
# -*- coding: utf-8 -*-

import argparse
import re

parser = argparse.ArgumentParser()
parser.add_argument('--www', action='store_true')
parser.add_argument('--output')
parser.add_argument('domain')
parser.add_argument('--port', required=True, type=int)
args = parser.parse_args()
with open('website.template.conf') as f:
    template = f.read()

template = template.replace('{domain}', args.domain)
template = template.replace('{port}', str(args.port))
if args.www:
    template = template.replace('{wwwdomain}', 'www.{}'.format(args.domain))
else:
    template = re.sub(r'ServerAlias.*\n', '.', template)

outfile = args.output if args.output else '.'
outfile.rstrip('/')
outfile += '/{}.conf'.format(args.domain)
with open(outfile, 'w') as out:
    out.write(template)
print(args.domain)