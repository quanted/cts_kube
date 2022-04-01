ARG BASE_REGISTRY=registry1.dso.mil
ARG BASE_IMAGE=ironbank/redhat/openjdk/openjdk8
ARG BASE_TAG=1.8.0

FROM tomcat:8.5.77-jdk8-openjdk AS base

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}