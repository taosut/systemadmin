import sys,os
import json
import urllib
import requests
import time
from functions import read_file,postURL,getURL,getResponseStatus
from functions import add_approval_stage
from functions import create_approval_JSON

config_filepath = os.getcwd()+"/configuration.json"
configuration = read_file(config_filepath,"configuration")

# configuratuon starts

ApproverStage1='udf_sline_301'
ApproverStage2='udf_sline_302'

# configuration ends

#time.sleep(60);
requestObj = read_file(sys.argv[1],"request")


operationJson={"INPUT_DATA":[]}
approversList=[]

if ApproverStage1 in requestObj['udf_fields'] and requestObj['udf_fields'][ApproverStage1] is not None:
	approvalStage1 = str(requestObj['udf_fields'][ApproverStage1]).split(',')
	operationJson = add_approval_stage(operationJson,"StageOne",approvalStage1)


if ApproverStage2 in requestObj['udf_fields'] and requestObj['udf_fields'][ApproverStage2] is not None:
	approvalStage2 = str(requestObj['udf_fields'][ApproverStage2]).split(',')
	operationJson = add_approval_stage(operationJson,"StageTwo",approvalStage2)

resultjson = create_approval_JSON("SET_APPROVAL_STAGE",operationJson,"true")

print(resultjson)


#print(details)	