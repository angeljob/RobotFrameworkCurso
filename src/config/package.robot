*** Settings ***

Documentation        Este será o nosso gerenciador de dependências.
Library              SeleniumLibrary
#Library              DebugLibrary

###########################
#         Keywords        #
###########################

Resource        ../auto/keywords/kws_web.robot


###########################
#          Config         #
###########################

Resource        hooks.robot
#Resource        hooks.yaml