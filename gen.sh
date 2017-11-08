#!/bin/bash
# 1: apimethod 2:api annotation

VarUpperApi=""
VarLowerApi=""
VarGoFileName=""
VarGoTestFileName=""

function fileFormat(){

# . => _
    str=$1
    VarGoFileName="api_"${str//./_}".go"
}

function testFileFormat(){
    str=$1
    VarGoTestFileName="api_"${str//./_}"_test.go"
}

function upperApi() {
    VarUpperApi=`echo $1 | perl -ne 'print s/[.]([a-z])/\u$1/gr' | perl -ne 'print s/^([a-z])/\u$1/gr'`
}

function lowerApi() {
    p2=${VarUpperApi:1}
    p1=${VarUpperApi:0:1}
    p1=`echo $p1|awk '{print tolower($0)}'`
    VarLowerApi=${p1}${p2}
}

# main
function init() {
    upperApi $1
    lowerApi $1
    fileFormat $1
    testFileFormat $1
}

function writeGoFile(){
    touch $VarGoFileName
    cat tpl.txt | sed "s/{{apiMethod}}/$1/g" | sed "s/{{api_upper}}/$VarUpperApi/g" | sed "s/{{api_lower}}/$VarLowerApi/g" |sed "s/{{funcAnn}}/$2/g" > $VarGoFileName
}


function writeGoTestFile(){
    touch $VarGoTestFileName
    cat tpl_test.txt | sed "s/{{apiMethod}}/$1/g" | sed "s/{{api_upper}}/$VarUpperApi/g" | sed "s/{{api_lower}}/$VarLowerApi/g" |sed "s/{{funcAnn}}/$2/g" > $VarGoTestFileName

}

function writeFile(){
    writeGoFile $1 $2
    writeGoTestFile $1 $2
}


function main(){
    init $1
    writeFile $1 $2
}

main $1 $2

