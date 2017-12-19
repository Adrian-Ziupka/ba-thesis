#!/bin/bash

pdflatex -interaction=nonstopmode foo-thesis.tex\
    && biber foo-thesis\
    && pdflatex -interaction=nonstopmode foo-thesis.tex\
    && pdflatex -interaction=nonstopmode foo-thesis.tex
