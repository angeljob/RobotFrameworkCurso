*** Settings ***
Documentation    Este sera o nosso gerenciador de dependencia.

Library    SeleniumLibrary
Library    DebugLibrary


######################
#      Keywords      #
######################
Resource    ../auto/Keywords/kws_web.robot



######################
#      Config        #
######################

Resource    hooks.robot
Resource    hooks.yaml

