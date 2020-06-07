#!/bin/bash

####################################################
# 필수 파라미터
# - INTERVAL: 리비전 체크 간격
# - FROM_URL: 인증된 소스 URL
# - FROM_PROJECT: 프로젝트명
# - TO_URL: 인증된 대상 URL
####################################################

# 최초 한번 진행
git clone ${FROM_URL} && cd ${FROM_PROJECT}
git remote add SYNC_TARGET ${TO_URL}
export LAST_FROM_REV=$(git log --abbrev-commit --pretty=oneline|cut -d " " -f 1 |head -n 1)

# 무한반복 되면서 리비전 체크 하여 변경이 있으면 동기화 진행.
while :
do
    git pull
    FROM_REV = $(git log --abbrev-commit --pretty=oneline|cut -d " " -f 1 |head -n 1)
    if [ "${LAST_FROM_REV}" != "${FROM_REV}" ]; then
        git push SYNC_TARGET
        export LAST_FROM_REV="${FROM_REV}"
    fi
    sleep ${INTERVAL}
done

