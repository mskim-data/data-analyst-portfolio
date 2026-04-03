# 김민석 | Data Analyst Portfolio

데이터 지표를 설계하고 로그 분석으로 개선 방향을 제안하는 데이터 분석 포트폴리오입니다.

---

## 포트폴리오 3줄 요약
- 메이플스토리 스타포스 UI 변경 A/B 테스트 분석
- 유저 정체 및 이탈에 대한 Retention 분석
- Python, SQL, BigQuery, Dashboarding tools 설계

---

## 기술 스택
- SQL
- Python
- BigQuery
- Looker Studio
- Tableau

---

## Project 1. 메이플스토리 스타포스 UI 개편 A/B 테스트 분석

### 프로젝트 개요
스타포스 강화 시스템 UI 개편이 결제 전환율에 미치는 영향을 검증하기 위해 A/B 테스트를 설계하고 분석했습니다.

### 분석 목적
- UI 개편이 결제 전환율 개선에 기여하는지 검증
- 세그먼트별 반응 차이 확인
- 주요 행동 변화 파악

### 데이터 및 실험 설계
- 대상: 285레벨 이상 유저 27,128명
- 기간: 14일
- 실험군: A / B
- Primary KPI: 결제 전환율

### My Role
- 실험 목적 정의 및 Primary KPI 설정
- 분석용 데이터 생성 및 DW 구조 설계
- SQL 기반 집계 쿼리 작성
- Python 기반 통계 검정 수행
- Looker Studio 대시보드 구성 및 결과 시각화
- 세그먼트별 결과 해석 및 개선안 정리

### 핵심 결과
- A: 10.78%
- B: 13.96%
- 차이: +3.18%p
- 통계적 유의성: p < 0.001
- Mid 세그먼트에서 상승폭이 가장 크게 나타남
- 파괴 방지 사용률 증가가 결제 전환 개선의 주요 행동 신호로 확인됨

### 주요 시각화
#### Conversion Rate
![Conversion Rate](images/Project1/conversion-Rate.png)

#### Segment Analyze
![Segment Analyze](images/Project1/segment-analyze.png)

#### Behavioral Mediating Indicator
![Behavioral Mediating Indicator](images/Project1/behavioral-mediating-indicator.png)

### 관련 파일
- [Project1 PDF](docs/Project1_UI%20개편%20AB%20테스트%20분석.pdf)
- [Project1 SQL 폴더](sql/Project1)

---

## Project 2. 성장 정체 구간과 유저 이탈 분석

### 프로젝트 개요
고레벨 구간에서 성장 정체와 이탈의 관계를 분석하고, 성장 효율 저하가 이탈에 미치는 영향을 검증한 프로젝트입니다.

### 분석 목적
- 성장 정체 구간과 이탈의 관계 확인
- 성장 효율과 최근 레벨업 경과일이 이탈에 미치는 영향 분석
- 개선 우선순위 도출

### 데이터 개요
- 대상: 260~300레벨 유저 10,000명
- 기간: 120일
- 로그 수: 120만 건
- 이탈 기준: 14일 이상 미접속

### My Role
- 분석 문제 정의 및 핵심 지표 설계
- 로그 데이터 전처리 및 구간별 집계 기준 수립
- 성장 효율과 이탈 간 관계 분석
- 레벨 구간별 이탈 패턴 시각화
- 운영 개선안 및 적용 방향 제안

### 핵심 결과
- 고레벨 지역으로 갈수록 이탈률 증가
- 성장 효율이 낮을수록 이탈률 증가
- 280레벨 이후 경험치 요구량 급증
- 성장 정체 구간 완화 필요성 확인

### 주요 시각화
#### Cohort Analyze
![Cohort Analyze](images/Project2/cohort-analyze.png)

#### Growth Analyze
![Growth Analyze](images/Project2/growth-analyze.png)

#### Growth Efficiency
![Growth Efficiency](images/Project2/growth-efficiency.png)

#### Level Analyze
![Level Analyze](images/Project2/level-analyze.png)

#### Location Churn
![location churn](images/Project2/location-churn.png)

### 관련 파일
- [Project2 PDF](docs/Project2_성장%20정체%20구간과%20유저%20이탈%20분석.pdf)
- [Project2 SQL 폴더](sql/Project2)

---

## Repository 구조
- `docs/` : 프로젝트 PDF 문서
- `images/Project1/` : Project1 시각화 이미지
- `images/Project2/` : Project2 시각화 이미지
- `sql/Project1/` : Project1 SQL
- `sql/Project2/` : Project2 SQL
- `notebooks/` : 분석 notebook 저장 폴더
