#!/bin/bash
#
#  Copyright (c) 2016 Intel Corporation 
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

NAME="[`basename $BASH_SOURCE[0]`]"
DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"
echo "$NAME DIR=$DIR"

MAINDIR="$(dirname $DIR)"
MAINDIR="$(dirname $MAINDIR)"

sparktkpackage=$MAINDIR/sparktkinstall


echo "Python path"
export PYTHONPATH=$MAINDIR/regression-tests:/opt/cloudera/parcels/CDH/lib/spark/python/pyspark:$MAINDIR/graphframes:/usr/lib/python2.7/site-packages/:$PYTHONPATH
echo $PYTHONPATH

#export SPARKTK_HOME=$MAINDIR/regression-tests/automation/sparktk-core/
export SPARKTK_HOME=$sparktkpackage/

echo "spark tk home"
echo $SPARKTK_HOME

py.test --boxed -n100 -v $MAINDIR/regression-tests
