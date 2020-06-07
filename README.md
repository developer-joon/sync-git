## 소개
클라우드 저장소 또는 프라이빗 저장소에서 소스를 동기화할 필요가 있을때 도커 컨테이너를 실행하여 간단하게 동기화 합니다.

단방향 동기화 방식이기 때문에 대상의 저장소의 주의가 필요합니다.


## 실행방법

### 파라미터
환경변수에 등록하여 사용합니다.
- INTERVAL: 리비전 체크 간격 (기본값: 300)
- FROM_URL: 인증된 소스 URL
- FROM_PROJECT: 프로젝트명
- TO_URL: 인증된 대상 URL

### 호스트
```
git clone https://github.com/developer-joon/sync-git.git
cd sync-git
export FROM_URL=http://github.com/developer-joon/source.git
export FROM_PROJECT=sync-git
export TO_URL=http://github.com/developer-joon/target.git
sh exec.sh
```

### 컨테이너
```
git clone https://github.com/developer-joon/sync-git.git
cd sync-git
docker build -t sync-git .
docker run --rm -d -e FROM_URL="..." -e "FROM_PROJECT=..." -e "TO_URL=..."  sync-git
```

# happy