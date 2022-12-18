-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.11.0-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- banksalard 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `banksalard`;
CREATE DATABASE IF NOT EXISTS `banksalard` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `banksalard`;

-- 테이블 banksalard.t_board 구조 내보내기
DROP TABLE IF EXISTS `t_board`;
CREATE TABLE IF NOT EXISTS `t_board` (
  `BOARD_SEQ` int(11) NOT NULL COMMENT '게시판 번호',
  `MEMBER_SEQ` int(11) NOT NULL COMMENT '회원 번호',
  `BOARD_TITLE` varchar(100) CHARACTER SET utf8mb3 NOT NULL DEFAULT '' COMMENT '제목',
  `BOARD_CONTENT` varchar(5000) CHARACTER SET utf8mb3 NOT NULL DEFAULT '' COMMENT '내용',
  `BOARD_IMAGE_NAME` varchar(45) CHARACTER SET utf8mb3 NOT NULL DEFAULT '' COMMENT '이미지',
  `BOARD_COUNT` int(11) NOT NULL DEFAULT 0 COMMENT '조회수',
  `BOARD_PUBLIC` varchar(2) CHARACTER SET utf8mb3 NOT NULL DEFAULT 'Y' COMMENT '비공개, 공개',
  `BOARD_STATE` varchar(2) CHARACTER SET utf8mb3 NOT NULL DEFAULT 'Y' COMMENT '삭제',
  `BOARD_TAG` varchar(300) CHARACTER SET utf8mb3 NOT NULL DEFAULT '0' COMMENT '해시태그',
  `BOARD_INSDATE` varchar(12) CHARACTER SET utf8mb3 NOT NULL DEFAULT curdate() COMMENT '작성일',
  `BOARD_UPDATE` varchar(12) CHARACTER SET utf8mb3 NOT NULL DEFAULT curdate() COMMENT '최종 수정일',
  PRIMARY KEY (`BOARD_SEQ`),
  KEY `MEMBER_SEQ` (`MEMBER_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 banksalard.t_board:~20 rows (대략적) 내보내기
DELETE FROM `t_board`;
INSERT INTO `t_board` (`BOARD_SEQ`, `MEMBER_SEQ`, `BOARD_TITLE`, `BOARD_CONTENT`, `BOARD_IMAGE_NAME`, `BOARD_COUNT`, `BOARD_PUBLIC`, `BOARD_STATE`, `BOARD_TAG`, `BOARD_INSDATE`, `BOARD_UPDATE`) VALUES
	(2, 2, '자산관리를 하기 위해서는!!', '우리는 모두 자신의 자산을 관리하는 법을 배워야 합니다. \r\n모두 행복하고 즐거운 주말 됩시다.', '2022년11월08일09시25분58초_매거진1.png', 3, 'Y', 'Y', '자산관리, 돈, 비전', '2022-11-08', '2022-11-08'),
	(3, 2, '코로나가 끼친 금전 영향!', '코로나가 발생한지 벌써 2년이 넘어가고 있습니다. 코로나로 우리는 제한된 삶을 살았고', '2022년11월08일09시35분24초_매거진2.png', 2, 'Y', 'Y', '코로나, 자산', '2022-11-08', '2022-11-08'),
	(4, 2, '연말이 되어가면서 싱숭생숭', '2022년이 벌써 거의 끝을 맞이해 가네용.. 벌써 11월이라니 세월이...야.속...ㅠㅠ', '2022년11월08일09시38분21초_매거진3.png', 0, 'Y', 'Y', '연말, 마감', '2022-11-08', '2022-11-08'),
	(5, 2, '정보를 공유하려고 합니다.', '수 많은 데이터들이 존재하고 그 것을 가공하여 사용할 수 있는 정보 또한 넘쳐납니다.', '2022년11월08일09시43분32초_매거진4.png', 3, 'Y', 'Y', '정보, 지식', '2022-11-08', '2022-11-08'),
	(6, 3, '우리 모두 도전합시다', '우리가 바로 이 시대의 유행이기 때문에 우리 자신으로부터 탈피할 수 없다.', '2022년11월08일09시45분29초_매거진5.png', 1, 'Y', 'Y', '도전, 관리, 자금', '2022-11-08', '2022-11-08'),
	(7, 3, '지혜가 필요한 시점인 당신에게...', '하나의 진리는 명백하다. 존재하는 것은 무엇이라도 정당하다.', '2022년11월08일09시46분09초_매거진6.png', 1, 'Y', 'Y', '지혜, 필요, 정당', '2022-11-08', '2022-11-08'),
	(8, 3, '자신감이 가지세요!! (주)생명보험', '자존심은 강력한 마약이지만, 자가면역 체계에는 별 도움이 되지 않는다.', '2022년11월08일09시47분14초_매거진7.png', 3, 'Y', 'Y', '자신감, 자존감, 생명보험', '2022-11-08', '2022-11-08'),
	(9, 3, '성공을 위한 첫걸음...', '자유롭게 피어나기. 이것이 내가 내린 성공의 정의다.', '2022년11월08일09시48분03초_매거진8.png', 1, 'Y', 'Y', '성공, 정의, 자유', '2022-11-08', '2022-11-08'),
	(10, 4, '나는 실패자인가? 성공한 사람인가?', '우리는 너무 많이 생각하고 너무 적게 느낀다.', '2022년11월08일09시50분54초_매거진9.png', 2, 'Y', 'Y', '성공, 실패, 생각', '2022-11-08', '2022-11-08'),
	(11, 4, '인간적으로 독서를 하려고 합니다.', '나의 개인적인 취미는 독서, 음악감상, 침묵이다.', '2022년11월08일09시51분39초_매거진10.png', 3, 'Y', 'Y', '독서, 음악감상', '2022-11-08', '2022-11-08'),
	(12, 4, '열심히 제 몸과 마음을 갈고 닦아봅니다.', '생선과 손님은 3일이 지나면 냄새를 풍긴다.', '2022년11월08일09시52분40초_매거진11.png', 2, 'Y', 'Y', '몸, 마음, 풍김', '2022-11-08', '2022-11-08'),
	(13, 4, '아무리 힘들어도 웃으면서 보내기', '웃음은 두 사람간의 가장 가까운 거리다', '2022년11월08일09시53분35초_매거진12.png', 2, 'Y', 'Y', '거리, 웃음, 괴로움', '2022-11-08', '2022-11-08'),
	(14, 5, '투자하는 것에 두려움을 가지고 있느 사람들이여~', '두려움 때문에 협상하지 맙시다. 그렇다고 협상하는 것을 두려워하지도 맙시다.', '2022년11월08일09시54분45초_매거진13.png', 2, 'Y', 'Y', '두려움, 협상', '2022-11-08', '2022-11-08'),
	(15, 5, '돈에 대한 정의를 해봅시다 ^^', '신이 돈에 대해 어떻게 생각하는지 알고 싶다면, 그가 돈을 어떤 사람에게 주는지 살펴보라.', '2022년11월08일09시55분55초_매거진14.png', 1, 'Y', 'Y', '정의, 신, 돈', '2022-11-08', '2022-11-08'),
	(16, 5, '현명한 소비가 사람을 만든다!!!', '가장 현명한 사람은 자신만의 방향을 따른다.', '2022년11월08일09시56분38초_매거진15.png', 1, 'Y', 'Y', '소비, 사람, 방향', '2022-11-08', '2022-11-08'),
	(17, 5, '열심히 일한 당신에게 주는 명언', '아침은 왕처럼, 점심은 왕자처럼, 저녁은 거지처럼 먹어라.', '2022년11월08일09시57분37초_매거진16.png', 2, 'Y', 'Y', '열심, 노력', '2022-11-08', '2022-11-08'),
	(18, 7, '우리에게 적대적인 문제에 대해', '당신의 적이 실수하고 있을 때 절대 방해하지 말라.', '2022년11월08일09시59분22초_매거진17.png', 1, 'Y', 'Y', '원수, 실수, 방해', '2022-11-08', '2022-11-08'),
	(19, 7, '우리 돈을 굴려보는 습관을 가집시다', '나쁜 습관은 고치는 것보다 예방하는 것이 더 쉽다.', '2022년11월08일09시59분58초_매거진18.png', 1, 'Y', 'Y', '습관, 예방, 고침', '2022-11-08', '2022-11-08'),
	(20, 7, '삶의 목적을 가지게 되면서', '자연과 조화롭게 살아가는 것이 삶의 목적이다.', '2022년11월08일10시00분35초_매거진19.png', 1, 'Y', 'Y', '조화, 목적, 삶', '2022-11-08', '2022-11-08'),
	(21, 7, '생각과 언어가 우리 자산의 끼치는 영향', '고결한 생각은 고상한 언어로 표현해야 한다.', '2022년11월08일10시01분06초_매거진20.png', 2, 'Y', 'Y', '언어, 고결, 표현', '2022-11-08', '2022-11-08');

-- 테이블 banksalard.t_card 구조 내보내기
DROP TABLE IF EXISTS `t_card`;
CREATE TABLE IF NOT EXISTS `t_card` (
  `CARD_SEQ` int(11) NOT NULL,
  `CARD_TYPE_SEQ` int(11) NOT NULL,
  `CARD_COMPANY_SEQ` int(11) NOT NULL,
  `CARD_IMAGE` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '원본 이름',
  `CARD_PATH` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '경로이름',
  `CARD_INSTDATE` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT '등록날짜',
  `CARD_POINT_SEL` int(2) NOT NULL COMMENT '카드 해택 방법',
  `CARD_NAME` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL COMMENT '카드 이름',
  `CARD_COUNT` int(11) DEFAULT 0 COMMENT '조회수',
  `CARD_STATE` varchar(2) CHARACTER SET utf8mb3 DEFAULT 'Y' COMMENT '카드 상태 Y=활동, N=정지',
  `CARD_BRAND` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL COMMENT '브랜드',
  PRIMARY KEY (`CARD_SEQ`),
  KEY `CARD_COMPANY_SEQ` (`CARD_COMPANY_SEQ`),
  KEY `CARD_TYPE_SEQ` (`CARD_TYPE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 banksalard.t_card:~0 rows (대략적) 내보내기
DELETE FROM `t_card`;
INSERT INTO `t_card` (`CARD_SEQ`, `CARD_TYPE_SEQ`, `CARD_COMPANY_SEQ`, `CARD_IMAGE`, `CARD_PATH`, `CARD_INSTDATE`, `CARD_POINT_SEL`, `CARD_NAME`, `CARD_COUNT`, `CARD_STATE`, `CARD_BRAND`) VALUES
	(1, 1, 1, '2022년11월07일09시56분45초_카드1.png', NULL, '2022-11-07 09:56:45', 1, '신한카드 래플', 0, 'Y', '1,2,3,'),
	(2, 1, 1, '2022년11월07일09시57분28초_카드2.png', NULL, '2022-11-07 09:57:28', 2, '신한카드 플리', 0, 'Y', '1,2,3,11,'),
	(3, 2, 1, '2022년11월07일09시59분59초_카드3.png', NULL, '2022-11-07 09:59:59', 2, '신한카드 Unboxing', 0, 'Y', '6,7,15,16,17,'),
	(4, 1, 1, '2022년11월07일10시03분48초_카드4.png', NULL, '2022-11-07 10:03:48', 2, '신한카드 Puzzle', 0, 'Y', '11,17,18,'),
	(5, 1, 1, '2022년11월07일10시04분51초_카드5.png', NULL, '2022-11-07 10:04:51', 0, '신한카드 My TeenS', 0, 'Y', '3,10,11,13,14,'),
	(6, 1, 1, '2022년11월07일10시07분38초_카드6.png', NULL, '2022-11-07 10:07:38', 2, '신한카드 YaY', 0, 'Y', '1,4,15,17,'),
	(7, 2, 2, '2022년11월07일10시09분16초_카드7.png', NULL, '2022-11-07 10:09:16', 2, 'GS Prime 현대카드', 1, 'Y', '1,3,5,18,'),
	(8, 2, 2, '2022년11월07일10시10분36초_카드8.png', NULL, '2022-11-07 10:10:36', 2, '현대카드 D-day', 0, 'Y', '2,3,17,18,'),
	(9, 2, 2, '2022년11월07일10시14분10초_카드9.png', NULL, '2022-11-07 10:14:10', 2, '현대카드 Mr.Life', 0, 'Y', '1,3,8,14,16,'),
	(10, 2, 2, '2022년11월07일10시21분54초_카드10.png', NULL, '2022-11-07 10:21:54', 2, '현대카드 Deep Oil', 0, 'Y', '4,6,8,15,17,'),
	(11, 2, 2, '2022년11월07일10시23분49초_카드11.png', NULL, '2022-11-07 10:23:49', 2, '현대카드 YOLO', 0, 'Y', '2,4,7,8,9,'),
	(12, 1, 3, '2022년11월07일10시36분03초_카드12.png', NULL, '2022-11-07 10:36:03', 2, 'IBK기업 Deep Dream Pllatinum', 0, 'Y', '1,3,5,6,16,18,'),
	(13, 2, 3, '2022년11월07일10시38분24초_카드13.png', NULL, '2022-11-07 10:38:24', 2, 'IBK기업 B.Big(삑)', 0, 'Y', '3,7,17,18,'),
	(14, 1, 3, '2022년11월07일10시49분04초_카드14.png', NULL, '2022-11-07 10:49:04', 2, 'IBK기업 My Car', 0, 'Y', '2,6,14,17,18,'),
	(15, 1, 3, '2022년11월07일11시01분11초_카드15.png', NULL, '2022-11-07 11:01:11', 2, 'IBK기업 SImple+', 0, 'Y', '1,11,12,13,16,18,'),
	(16, 2, 3, '2022년11월07일11시07분23초_카드16.png', NULL, '2022-11-07 11:07:23', 2, 'IBK기업 아모레퍼시픽', 0, 'Y', '2,14,17,'),
	(17, 1, 4, '2022년11월07일11시12분54초_카드17.png', NULL, '2022-11-07 11:12:54', 2, 'KB국민 HELLO', 0, 'Y', '2,5,14,17,'),
	(18, 3, 4, '2022년11월07일11시28분51초_카드18.png', NULL, '2022-11-07 11:28:51', 2, '위버스 KB국민', 0, 'Y', '2,4,14,17,'),
	(19, 2, 4, '2022년11월07일11시30분25초_카드19.png', NULL, '2022-11-07 11:30:25', 2, 'GOGO KB국민', 0, 'Y', '5,7,9,18,'),
	(20, 1, 4, '2022년11월07일11시32분46초_카드20.png', NULL, '2022-11-07 11:32:46', 2, 'KB국민 JAVA', 0, 'Y', '14,16,18,'),
	(21, 3, 4, '2022년11월07일11시42분02초_카드21.png', NULL, '2022-11-07 11:42:02', 2, 'KB국민 HIpStar', 0, 'Y', '2,6,9,11,'),
	(22, 2, 5, '2022년11월07일13시03분58초_카드22.png', NULL, '2022-11-07 13:03:58', 2, '롯데 FileUpload', 0, 'Y', '2,16,17,'),
	(23, 1, 5, '2022년11월07일13시07분36초_카드23.png', NULL, '2022-11-07 13:07:36', 2, '롯데 Spring', 0, 'Y', '4,5,12,17,18,'),
	(24, 1, 5, '2022년11월07일13시09분09초_카드24.png', NULL, '2022-11-07 13:09:09', 2, '롯데 Mybatis', 0, 'Y', '2,6,7,16,'),
	(25, 1, 6, '2022년11월07일13시10분50초_카드25.png', NULL, '2022-11-07 13:10:50', 2, '삼성 페이', 0, 'Y', '1,4,5,16,'),
	(26, 1, 6, '2022년11월07일13시12분15초_카드26.png', NULL, '2022-11-07 13:12:15', 2, '삼성 FireFox', 0, 'Y', '2,5,7,17,18,'),
	(27, 1, 6, '2022년11월07일13시13분20초_카드27.png', NULL, '2022-11-07 13:13:20', 2, '삼성 UltraD', 0, 'Y', '2,4,17,'),
	(28, 2, 7, '2022년11월07일13시15분32초_카드28.png', NULL, '2022-11-07 13:15:32', 2, '하나 Notice', 0, 'Y', '2,6,12,17,'),
	(29, 2, 7, '2022년11월07일13시19분53초_카드29.png', NULL, '2022-11-07 13:19:53', 2, '하나 SuIN', 0, 'Y', '3,6,7,16,'),
	(30, 2, 7, '2022년11월07일13시20분51초_카드30.png', NULL, '2022-11-07 13:20:51', 2, '하나 retro', 0, 'Y', '5,7,16,17,18,'),
	(31, 1, 8, '2022년11월07일13시22분58초_카드31.png', NULL, '2022-11-07 13:22:58', 2, '우리 NullPoint', 0, 'Y', '4,6,10,17,'),
	(32, 2, 8, '2022년11월07일13시35분39초_카드32.png', NULL, '2022-11-07 13:35:39', 2, '우리 Private', 0, 'Y', '5,11,12,17,'),
	(33, 1, 8, '2022년11월07일13시37분13초_카드33.png', NULL, '2022-11-07 13:37:13', 2, '우리 Overring', 0, 'Y', '3,4,10,14,'),
	(34, 1, 8, '2022년11월07일13시38분51초_카드34.png', NULL, '2022-11-07 13:38:51', 2, '우리 나라만세', 0, 'Y', '3,16,17,'),
	(35, 1, 9, '2022년11월07일13시42분02초_카드35.png', NULL, '2022-11-07 13:42:02', 2, 'BC바로 OverPower', 0, 'Y', '3,8,18,'),
	(36, 2, 9, '2022년11월07일13시44분53초_카드36.png', NULL, '2022-11-07 13:44:53', 2, 'BC바로 Mirroring', 0, 'Y', '1,3,8,16,'),
	(37, 3, 10, '2022년11월07일13시46분52초_카드37.png', NULL, '2022-11-07 13:46:52', 2, '현대백화점 SOLOEXIT', 0, 'Y', '4,10,14,17,'),
	(38, 2, 10, '2022년11월07일13시49분45초_카드38.png', NULL, '2022-11-07 13:49:45', 2, '현대백화점 JAVA', 0, 'Y', '3,6,9,18,'),
	(39, 1, 10, '2022년11월07일13시51분59초_카드39.png', NULL, '2022-11-07 13:51:59', 2, '현대백화점 WhereIs', 0, 'Y', '1,10,16,17,'),
	(40, 1, 9, '2022년11월07일13시53분24초_카드40.png', NULL, '2022-11-07 13:53:24', 2, 'BC바로 HairIsNull', 0, 'Y', '2,3,5,12,18,'),
	(41, 1, 3, '2022년11월07일13시55분47초_카드41.png', NULL, '2022-11-07 13:55:47', 2, 'IBK기업 Figihting', 25, 'Y', '1,4,16,'),
	(42, 1, 1, '2022년11월07일14시00분43초_카드42.png', NULL, '2022-11-07 14:00:43', 2, '신한 NothingBetter', 0, 'Y', '1,3,6,8,16,'),
	(43, 1, 5, '2022년11월07일14시02분53초_카드43.png', NULL, '2022-11-07 14:02:53', 2, '롯데 LEGOLAND', 36, 'Y', '2,3,7,'),
	(44, 3, 7, '2022년11월07일14시06분39초_카드44.png', NULL, '2022-11-07 14:06:39', 2, '하나 SpeedStar', 0, 'Y', '2,3,7,'),
	(45, 3, 7, '2022년11월07일14시09분56초_카드45.png', NULL, '2022-11-07 14:09:56', 2, '하나 SINGSONGSANG', 111, 'Y', '1,6,16,17,'),
	(46, 3, 7, '2022년11월07일14시11분46초_카드46.png', NULL, '2022-11-07 14:11:46', 2, '하나 직박구리', 20, 'Y', '4,7,17,'),
	(47, 3, 6, '2022년11월07일14시14분29초_카드47.png', NULL, '2022-11-07 14:14:29', 2, '삼성 ManToMan', 0, 'Y', '4,9,17,'),
	(48, 3, 4, '2022년11월07일14시17분50초_카드48.png', NULL, '2022-11-07 14:17:50', 2, 'KB국민 KfakerR', 0, 'Y', '2,7,9,11,16,'),
	(49, 3, 8, '2022년11월07일14시20분15초_카드49.png', NULL, '2022-11-07 14:20:15', 2, '우리 IOSCentury', 30, 'Y', '1,16,17,'),
	(50, 3, 6, '2022년11월07일14시22분57초_카드50.png', NULL, '2022-11-07 14:22:57', 2, '삼성 LostPark', 0, 'Y', '1,7,17,18,'),
	(51, 1, 5, '2022년11월07일14시27분10초_카드1.png', NULL, '2022-11-07 14:27:10', 2, '롯데 DooDooDoo', 0, 'Y', '1,6,16,'),
	(52, 1, 4, '2022년11월07일16시07분52초_카드2.png', NULL, '2022-11-07 16:07:52', 1, 'KB국민 Monster', 100, 'Y', '2,5,7,18,'),
	(53, 2, 7, '2022년11월07일16시09분10초_카드3.png', NULL, '2022-11-07 16:09:10', 1, '하나 OTLCARD', 0, 'Y', '3,7,11,'),
	(54, 3, 8, '2022년11월07일16시09분57초_카드4.png', NULL, '2022-11-07 16:09:57', 1, '우리 Protected', 1, 'Y', '14,16,18,'),
	(55, 1, 10, '2022년11월07일16시10분59초_카드5.png', NULL, '2022-11-07 16:10:59', 1, '현대백화점 LostBag', 5, 'Y', '1,5,14,'),
	(56, 1, 6, '2022년11월07일16시13분29초_카드6.png', NULL, '2022-11-07 16:13:29', 1, '삼성 Shutdown', 0, 'Y', '3,7,16,'),
	(57, 2, 5, '2022년11월07일16시14분28초_카드7.png', NULL, '2022-11-07 16:14:28', 1, '롯데 TuTCard', 33, 'Y', '2,6,17,'),
	(58, 1, 4, '2022년11월07일16시15분27초_카드8.png', NULL, '2022-11-07 16:15:27', 1, 'KB국민 LOLOStar', 0, 'Y', '3,8,18,'),
	(59, 2, 3, '2022년11월07일16시20분38초_카드9.png', NULL, '2022-11-07 16:20:38', 1, 'IBK기업 007Event', 0, 'Y', '1,11,16,'),
	(60, 1, 2, '2022년11월07일16시21분22초_카드10.png', NULL, '2022-11-07 16:21:22', 1, '현대 history101', 76, 'Y', '2,8,17,'),
	(61, 1, 7, '2022년11월07일16시22분20초_카드11.png', NULL, '2022-11-07 16:22:20', 1, '하나 MarioCard', 0, 'Y', '1,16,18,'),
	(62, 1, 5, '2022년11월07일16시23분05초_카드12.png', NULL, '2022-11-07 16:23:05', 1, '롯데 Crawling', 1, 'Y', '2,7,17,'),
	(63, 1, 8, '2022년11월07일16시23분41초_카드13.png', NULL, '2022-11-07 16:23:41', 1, '우리 SecretCard', 88, 'Y', '3,6,10,18,'),
	(64, 1, 8, '2022년11월07일16시24분37초_카드14.png', NULL, '2022-11-07 16:24:37', 1, '우리 ECLIPSE', 2, 'Y', '4,8,18,'),
	(65, 1, 5, '2022년11월07일16시25분18초_카드15.png', NULL, '2022-11-07 16:25:18', 1, '롯데 GangNamBuilding', 0, 'Y', '3,5,6,16,18,'),
	(66, 2, 1, '2022년11월07일16시26분22초_카드16.png', NULL, '2022-11-07 16:26:22', 1, '신한 MilkTea', 0, 'Y', '2,4,7,17,'),
	(67, 2, 7, '2022년11월07일16시27분05초_카드17.png', NULL, '2022-11-07 16:27:05', 1, '하나 ArmStrong', 156, 'Y', '4,8,17,'),
	(68, 2, 9, '2022년11월07일16시27분58초_카드18.png', NULL, '2022-11-07 16:27:58', 1, 'BC바로 GooGooDan', 0, 'Y', '4,8,18,'),
	(69, 1, 6, '2022년11월07일16시28분36초_카드19.png', NULL, '2022-11-07 16:28:36', 1, '삼성 AfterMooN', 0, 'Y', '1,7,8,16,17,'),
	(70, 1, 7, '2022년11월07일16시29분11초_카드20.png', NULL, '2022-11-07 16:29:11', 1, '하나 TaskingControl', 55, 'Y', '3,6,8,18,'),
	(71, 1, 1, '2022년11월13일00시07분31초_카드1.png', NULL, '2022-11-13 00:07:31', 1, '신한 asset', 1, 'Y', '1,3,4,6,16,17,');

-- 테이블 banksalard.t_card_benefit 구조 내보내기
DROP TABLE IF EXISTS `t_card_benefit`;
CREATE TABLE IF NOT EXISTS `t_card_benefit` (
  `BENEFIT_SEQ` int(11) NOT NULL COMMENT 'PK',
  `CARD_SEQ` int(11) DEFAULT NULL COMMENT '카드정보 INDEX',
  `PLACE_MST_SEQ` int(11) DEFAULT NULL COMMENT '카드 할인 장소',
  `CARD_PRICE` int(11) DEFAULT NULL COMMENT '카드 할인가격 기준',
  `CARD_SALE` varchar(10) DEFAULT NULL COMMENT '카드 할인 금액',
  `BENEFIT_STATE` varchar(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'Y' COMMENT '카드할인 사용기준',
  `BENEFIT_INSTDATE` varchar(20) DEFAULT NULL COMMENT '카드할인 적용시간',
  PRIMARY KEY (`BENEFIT_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 banksalard.t_card_benefit:~218 rows (대략적) 내보내기
DELETE FROM `t_card_benefit`;
INSERT INTO `t_card_benefit` (`BENEFIT_SEQ`, `CARD_SEQ`, `PLACE_MST_SEQ`, `CARD_PRICE`, `CARD_SALE`, `BENEFIT_STATE`, `BENEFIT_INSTDATE`) VALUES
	(2, 15, 2, 150000, '5000', 'Y', '2022-11-04 01:46:44'),
	(3, 15, 8, 200000, '5000', 'Y', '2022-11-04 01:46:56'),
	(4, 15, 10, 200000, '5000', 'Y', '2022-11-04 01:47:06'),
	(5, 15, 14, 250000, '5000', 'Y', '2022-11-04 01:47:15'),
	(6, 16, 17, 200000, '5000', 'N', '2022-11-04 01:48:00'),
	(7, 16, 14, 250000, '5000', 'N', '2022-11-04 01:48:07'),
	(8, 16, 0, 0, '0', 'Y', '2022-11-04 01:48:10'),
	(9, 16, 14, 250000, '5000', 'Y', '2022-11-04 01:48:17'),
	(10, 16, 18, 250000, '2%', 'Y', '2022-11-04 01:52:45'),
	(11, 16, 3, 200000, '3000', 'Y', '2022-11-04 01:52:54'),
	(12, 17, 2, 100000, '3000', 'Y', '2022-11-04 01:54:11'),
	(13, 17, 3, 150000, '4000', 'Y', '2022-11-04 01:54:19'),
	(14, 17, 9, 150000, '3000', 'Y', '2022-11-04 01:54:29'),
	(15, 17, 12, 100000, '1000', 'Y', '2022-11-04 01:54:42'),
	(16, 18, 18, 200000, '2000', 'Y', '2022-11-04 01:55:16'),
	(17, 18, 7, 300000, '2%', 'Y', '2022-11-04 01:55:27'),
	(18, 19, 9, 100000, '3000', 'Y', '2022-11-04 01:57:01'),
	(19, 19, 15, 150000, '5000', 'Y', '2022-11-04 01:57:10'),
	(20, 19, 7, 200000, '10000', 'Y', '2022-11-04 01:57:18'),
	(21, 19, 2, 100000, '2000', 'Y', '2022-11-04 01:57:25'),
	(22, 15, 2, 100000, '2000', 'Y', '2022-11-06 16:56:47'),
	(23, 20, 18, 200000, '5000', 'Y', '2022-11-07 02:07:38'),
	(24, 20, 18, 100000, '2000', 'Y', '2022-11-07 02:07:45'),
	(25, 20, 2, 100000, '4000', 'Y', '2022-11-07 02:07:51'),
	(26, 20, 10, 100000, '2000', 'Y', '2022-11-07 02:07:59'),
	(27, 20, 11, 100000, '2000', 'Y', '2022-11-07 02:08:04'),
	(28, 20, 13, 200000, '3000', 'Y', '2022-11-07 02:08:09'),
	(29, 20, 15, 150000, '5000', 'Y', '2022-11-07 02:08:14'),
	(30, 20, 16, 100000, '3000', 'Y', '2022-11-07 02:08:21'),
	(31, 21, 1, 100000, '3000', 'Y', '2022-11-07 02:09:01'),
	(32, 21, 2, 100000, '4000', 'Y', '2022-11-07 02:09:06'),
	(33, 21, 5, 100000, '5000', 'Y', '2022-11-07 02:09:12'),
	(34, 21, 12, 150000, '2000', 'Y', '2022-11-07 02:09:18'),
	(35, 21, 9, 100000, '1000', 'Y', '2022-11-07 02:09:26'),
	(36, 21, 17, 200000, '5000', 'Y', '2022-11-07 02:09:31'),
	(37, 22, 15, 200000, '2%', 'Y', '2022-11-07 02:10:24'),
	(38, 22, 5, 100000, '5000', 'Y', '2022-11-07 02:10:30'),
	(39, 22, 7, 200000, '2%', 'Y', '2022-11-07 02:10:46'),
	(40, 23, 15, 100000, '3000', 'Y', '2022-11-07 02:11:30'),
	(41, 23, 2, 100000, '2000', 'Y', '2022-11-07 02:11:35'),
	(42, 23, 6, 100000, '4000', 'Y', '2022-11-07 02:11:41'),
	(43, 23, 13, 200000, '5000', 'Y', '2022-11-07 02:11:47'),
	(44, 23, 11, 100000, '4000', 'Y', '2022-11-07 02:11:57'),
	(45, 23, 2, 300000, '3%', 'Y', '2022-11-07 02:12:21'),
	(46, 24, 10, 150000, '5000', 'Y', '2022-11-07 02:13:19'),
	(47, 24, 4, 150000, '5000', 'Y', '2022-11-07 02:13:24'),
	(48, 24, 2, 100000, '10000', 'Y', '2022-11-07 02:13:28'),
	(49, 24, 8, 150000, '5000', 'Y', '2022-11-07 02:13:34'),
	(50, 24, 8, 250000, '10000', 'Y', '2022-11-07 02:13:45'),
	(51, 24, 3, 150000, '4000', 'Y', '2022-11-07 02:13:53'),
	(52, 25, 17, 100000, '1000', 'Y', '2022-11-07 02:14:35'),
	(53, 25, 17, 300000, '2%', 'Y', '2022-11-07 02:14:47'),
	(54, 25, 13, 100000, '5000', 'Y', '2022-11-07 02:14:56'),
	(55, 25, 7, 100000, '2000', 'Y', '2022-11-07 02:15:08'),
	(56, 25, 12, 100000, '1000', 'Y', '2022-11-07 02:15:28'),
	(57, 25, 4, 100000, '1000', 'Y', '2022-11-07 02:15:43'),
	(58, 25, 3, 100000, '1000', 'Y', '2022-11-07 02:15:49'),
	(59, 26, 1, 150000, '3000', 'Y', '2022-11-07 02:16:27'),
	(60, 26, 2, 100000, '1000', 'Y', '2022-11-07 02:16:32'),
	(61, 26, 3, 100000, '2000', 'Y', '2022-11-07 02:16:36'),
	(62, 26, 11, 150000, '5000', 'Y', '2022-11-07 02:16:41'),
	(63, 26, 16, 150000, '3000', 'Y', '2022-11-07 02:16:45'),
	(64, 27, 16, 100000, '2000', 'Y', '2022-11-07 02:17:29'),
	(65, 27, 5, 100000, '5000', 'Y', '2022-11-07 02:17:34'),
	(66, 27, 14, 100000, '5000', 'Y', '2022-11-07 02:17:40'),
	(67, 27, 16, 200000, '10000', 'Y', '2022-11-07 02:17:47'),
	(68, 28, 1, 100000, '1000', 'Y', '2022-11-07 02:40:06'),
	(69, 28, 3, 100000, '2000', 'Y', '2022-11-07 02:40:10'),
	(70, 28, 11, 150000, '4000', 'Y', '2022-11-07 02:40:15'),
	(71, 28, 16, 200000, '3000', 'Y', '2022-11-07 02:40:19'),
	(72, 16, 2, 150000, '3000', 'Y', '2022-11-07 02:40:29'),
	(73, 16, 15, 150000, '4000', 'Y', '2022-11-07 02:40:33'),
	(74, 16, 16, 100000, '3000', 'Y', '2022-11-07 02:40:39'),
	(75, 29, 9, 100000, '3000', 'Y', '2022-11-07 02:41:37'),
	(76, 29, 17, 150000, '4000', 'Y', '2022-11-07 02:41:40'),
	(77, 29, 2, 100000, '1%', 'Y', '2022-11-07 02:41:45'),
	(78, 29, 15, 100000, '2000', 'Y', '2022-11-07 02:41:50'),
	(79, 29, 17, 300000, '10000', 'Y', '2022-11-07 02:41:57'),
	(80, 29, 16, 100000, '1000', 'Y', '2022-11-07 02:42:01'),
	(81, 29, 3, 100000, '2000', 'Y', '2022-11-07 02:42:08'),
	(82, 29, 5, 100000, '1000', 'Y', '2022-11-07 02:42:13'),
	(83, 30, 1, 100000, '1000', 'Y', '2022-11-07 02:43:13'),
	(84, 30, 2, 100000, '1000', 'Y', '2022-11-07 02:43:19'),
	(85, 30, 3, 100000, '1000', 'Y', '2022-11-07 02:43:23'),
	(86, 30, 4, 100000, '1000', 'Y', '2022-11-07 02:43:30'),
	(87, 30, 5, 100000, '1000', 'Y', '2022-11-07 02:43:34'),
	(88, 30, 7, 100000, '1000', 'Y', '2022-11-07 02:43:38'),
	(89, 30, 8, 100000, '1000', 'Y', '2022-11-07 02:43:42'),
	(90, 30, 9, 100000, '1000', 'Y', '2022-11-07 02:43:47'),
	(91, 30, 11, 100000, '1000', 'Y', '2022-11-07 02:43:55'),
	(92, 30, 10, 100000, '1000', 'Y', '2022-11-07 02:44:03'),
	(93, 30, 12, 100000, '1000', 'Y', '2022-11-07 02:44:08'),
	(94, 30, 13, 100000, '1000', 'Y', '2022-11-07 02:44:14'),
	(95, 30, 14, 100000, '1000', 'Y', '2022-11-07 02:44:23'),
	(96, 30, 15, 100000, '1000', 'Y', '2022-11-07 02:44:29'),
	(97, 30, 16, 100000, '1000', 'Y', '2022-11-07 02:44:35'),
	(98, 30, 17, 100000, '1000', 'Y', '2022-11-07 02:44:39'),
	(99, 30, 18, 100000, '1000', 'Y', '2022-11-07 02:44:43'),
	(100, 31, 1, 100000, '3000', 'Y', '2022-11-07 02:45:42'),
	(101, 31, 7, 150000, '4000', 'Y', '2022-11-07 02:45:48'),
	(102, 31, 13, 100000, '1000', 'Y', '2022-11-07 02:45:51'),
	(103, 31, 16, 100000, '4000', 'Y', '2022-11-07 02:45:58'),
	(104, 31, 15, 100000, '2000', 'Y', '2022-11-07 02:46:03'),
	(105, 32, 10, 100000, '3000', 'Y', '2022-11-07 02:46:43'),
	(106, 32, 16, 100000, '5000', 'Y', '2022-11-07 02:46:47'),
	(107, 32, 16, 100000, '4000', 'Y', '2022-11-07 02:46:54'),
	(108, 32, 5, 100000, '3000', 'Y', '2022-11-07 02:47:00'),
	(109, 33, 2, 100000, '4000', 'Y', '2022-11-07 02:47:35'),
	(110, 33, 5, 100000, '5000', 'Y', '2022-11-07 02:47:40'),
	(111, 33, 10, 100000, '5000', 'Y', '2022-11-07 02:47:46'),
	(112, 34, 13, 100000, '2000', 'Y', '2022-11-07 02:48:32'),
	(113, 34, 2, 100000, '5000', 'Y', '2022-11-07 02:48:36'),
	(114, 34, 1, 150000, '3000', 'Y', '2022-11-07 02:48:40'),
	(115, 34, 13, 200000, '3000', 'Y', '2022-11-07 02:48:46'),
	(116, 34, 16, 150000, '2%', 'Y', '2022-11-07 02:48:52'),
	(117, 35, 8, 100000, '4000', 'Y', '2022-11-07 02:53:24'),
	(118, 35, 8, 200000, '3%', 'Y', '2022-11-07 02:53:40'),
	(119, 35, 8, 300000, '4%', 'Y', '2022-11-07 02:53:52'),
	(120, 35, 2, 100000, '5000', 'Y', '2022-11-07 02:53:57'),
	(121, 36, 10, 100000, '4000', 'Y', '2022-11-07 02:54:50'),
	(122, 36, 2, 100000, '5000', 'Y', '2022-11-07 02:54:54'),
	(123, 36, 13, 100000, '3000', 'Y', '2022-11-07 02:54:58'),
	(124, 36, 1, 100000, '2000', 'Y', '2022-11-07 02:55:05'),
	(125, 36, 15, 200000, '4000', 'Y', '2022-11-07 02:55:09'),
	(126, 37, 13, 100000, '3000', 'Y', '2022-11-07 02:56:17'),
	(127, 37, 2, 200000, '10000', 'Y', '2022-11-07 02:56:23'),
	(128, 37, 2, 100000, '1000', 'Y', '2022-11-07 02:56:27'),
	(129, 37, 5, 150000, '5000', 'Y', '2022-11-07 02:56:33'),
	(130, 37, 13, 150000, '4000', 'Y', '2022-11-07 02:56:39'),
	(131, 38, 10, 100000, '4000', 'Y', '2022-11-07 02:57:12'),
	(132, 38, 4, 200000, '3000', 'Y', '2022-11-07 02:57:16'),
	(133, 38, 2, 200000, '3000', 'Y', '2022-11-07 02:57:20'),
	(134, 38, 1, 100000, '5000', 'Y', '2022-11-07 02:57:24'),
	(135, 38, 16, 100000, '3000', 'Y', '2022-11-07 02:57:28'),
	(136, 38, 15, 100000, '5000', 'Y', '2022-11-07 02:57:33'),
	(137, 38, 14, 100000, '1000', 'Y', '2022-11-07 02:57:39'),
	(138, 51, 12, 100000, '5000', 'Y', '2022-11-13 02:04:31'),
	(139, 51, 8, 150000, '20000', 'Y', '2022-11-13 02:04:38'),
	(140, 51, 5, 100000, '6000', 'Y', '2022-11-13 02:04:49'),
	(141, 51, 2, 150000, '5000', 'Y', '2022-11-13 02:04:57'),
	(142, 50, 2, 100000, '4000', 'Y', '2022-11-13 02:05:05'),
	(143, 50, 5, 100000, '5000', 'Y', '2022-11-13 02:05:13'),
	(144, 50, 7, 200000, '7000', 'Y', '2022-11-13 02:05:18'),
	(145, 50, 11, 100000, '4000', 'Y', '2022-11-13 02:05:26'),
	(146, 50, 15, 100000, '4000', 'Y', '2022-11-13 02:05:32'),
	(147, 49, 6, 100000, '3000', 'Y', '2022-11-13 02:05:43'),
	(148, 49, 9, 100000, '4000', 'Y', '2022-11-13 02:05:55'),
	(149, 49, 11, 150000, '3000', 'Y', '2022-11-13 02:06:05'),
	(150, 49, 13, 150000, '4000', 'Y', '2022-11-13 02:06:12'),
	(151, 48, 12, 100000, '2000', 'Y', '2022-11-13 02:06:45'),
	(152, 48, 8, 100000, '4000', 'Y', '2022-11-13 02:06:53'),
	(153, 48, 11, 150000, '4000', 'Y', '2022-11-13 02:07:03'),
	(154, 48, 16, 200000, '4000', 'Y', '2022-11-13 02:07:15'),
	(155, 48, 17, 100000, '5000', 'Y', '2022-11-13 02:07:25'),
	(156, 47, 18, 300000, '8%', 'Y', '2022-11-13 02:07:35'),
	(157, 47, 5, 100000, '4000', 'Y', '2022-11-13 02:07:43'),
	(158, 47, 12, 150000, '4%', 'Y', '2022-11-13 02:07:49'),
	(159, 46, 14, 100000, '3000', 'Y', '2022-11-13 02:08:04'),
	(160, 46, 6, 100000, '3000', 'Y', '2022-11-13 02:08:13'),
	(161, 46, 4, 100000, '1%', 'Y', '2022-11-13 02:08:23'),
	(162, 46, 16, 150000, '2%', 'Y', '2022-11-13 02:08:28'),
	(163, 45, 13, 150000, '15000', 'Y', '2022-11-13 02:08:36'),
	(164, 45, 3, 200000, '10000', 'Y', '2022-11-13 02:08:42'),
	(165, 45, 16, 200000, '8000', 'Y', '2022-11-13 02:08:46'),
	(166, 45, 17, 150000, '5000', 'Y', '2022-11-13 02:08:51'),
	(167, 44, 18, 200000, '5%', 'Y', '2022-11-13 02:09:00'),
	(168, 44, 17, 200000, '3%', 'Y', '2022-11-13 02:09:06'),
	(169, 44, 16, 200000, '2%', 'Y', '2022-11-13 02:09:14'),
	(170, 44, 13, 100000, '20000', 'Y', '2022-11-13 02:09:20'),
	(171, 44, 2, 100000, '2000', 'Y', '2022-11-13 02:09:24'),
	(172, 43, 10, 100000, '9000', 'Y', '2022-11-13 02:09:32'),
	(173, 43, 15, 100000, '1%', 'Y', '2022-11-13 02:09:38'),
	(174, 43, 8, 300000, '3%', 'Y', '2022-11-13 02:09:44'),
	(175, 43, 17, 200000, '3%', 'Y', '2022-11-13 02:09:49'),
	(176, 42, 8, 100000, '3000', 'Y', '2022-11-13 02:09:58'),
	(177, 42, 2, 100000, '4000', 'Y', '2022-11-13 02:10:04'),
	(178, 42, 4, 100000, '1%', 'Y', '2022-11-13 02:10:10'),
	(179, 42, 13, 100000, '25000', 'Y', '2022-11-13 02:10:16'),
	(180, 42, 16, 150000, '1%', 'Y', '2022-11-13 02:10:20'),
	(181, 42, 17, 150000, '4%', 'Y', '2022-11-13 02:10:25'),
	(182, 41, 18, 250000, '7%', 'Y', '2022-11-13 02:10:34'),
	(183, 41, 16, 300000, '6%', 'Y', '2022-11-13 02:10:39'),
	(184, 41, 17, 300000, '5%', 'Y', '2022-11-13 02:10:45'),
	(185, 40, 14, 150000, '8000', 'Y', '2022-11-13 02:10:57'),
	(186, 40, 5, 150000, '2000', 'Y', '2022-11-13 02:11:02'),
	(187, 40, 4, 100000, '8000', 'Y', '2022-11-13 02:11:08'),
	(188, 40, 8, 200000, '9000', 'Y', '2022-11-13 02:11:15'),
	(189, 40, 17, 100000, '1%', 'Y', '2022-11-13 02:11:21'),
	(190, 39, 15, 150000, '8000', 'Y', '2022-11-13 02:11:35'),
	(191, 39, 2, 100000, '6000', 'Y', '2022-11-13 02:11:41'),
	(192, 39, 7, 200000, '5%', 'Y', '2022-11-13 02:11:48'),
	(193, 39, 17, 200000, '1%', 'Y', '2022-11-13 02:11:52'),
	(194, 39, 15, 150000, '8000', 'Y', '2022-11-13 02:12:20'),
	(195, 43, 10, 200000, '20000', 'Y', '2022-11-13 02:14:01'),
	(196, 43, 4, 100000, '3000', 'Y', '2022-11-13 02:14:07'),
	(197, 41, 2, 150000, '6000', 'Y', '2022-11-13 02:14:20'),
	(198, 11, 9, 100000, '5000', 'Y', '2022-11-13 14:13:12'),
	(199, 11, 1, 150000, '4000', 'Y', '2022-11-13 14:13:17'),
	(200, 11, 4, 150000, '9000', 'Y', '2022-11-13 14:13:22'),
	(201, 11, 17, 100000, '25000', 'Y', '2022-11-13 14:13:26'),
	(202, 11, 17, 150000, '1%', 'Y', '2022-11-13 14:13:30'),
	(203, 9, 12, 150000, '4%', 'Y', '2022-11-13 14:13:37'),
	(204, 9, 2, 150000, '4000', 'Y', '2022-11-13 14:13:42'),
	(205, 9, 5, 150000, '4000', 'Y', '2022-11-13 14:13:48'),
	(206, 9, 14, 200000, '2%', 'Y', '2022-11-13 14:13:53'),
	(207, 9, 10, 200000, '9000', 'Y', '2022-11-13 14:13:57'),
	(208, 9, 4, 100000, '5000', 'Y', '2022-11-13 14:14:04'),
	(209, 8, 7, 100000, '4000', 'Y', '2022-11-13 14:14:10'),
	(210, 8, 4, 150000, '5%', 'Y', '2022-11-13 14:14:15'),
	(211, 8, 16, 150000, '4000', 'Y', '2022-11-13 14:14:19'),
	(212, 8, 10, 100000, '7000', 'Y', '2022-11-13 14:14:23'),
	(213, 7, 3, 100000, '5000', 'Y', '2022-11-13 14:14:31'),
	(214, 7, 9, 100000, '7000', 'Y', '2022-11-13 14:14:35'),
	(215, 7, 8, 100000, '2%', 'Y', '2022-11-13 14:14:39'),
	(216, 7, 15, 100000, '4000', 'Y', '2022-11-13 14:15:07'),
	(217, 7, 16, 150000, '6000', 'Y', '2022-11-13 14:15:15'),
	(218, 7, 18, 150000, '2%', 'Y', '2022-11-13 14:15:21'),
	(219, 7, 4, 100000, '5000', 'Y', '2022-11-13 14:15:29');

-- 테이블 banksalard.t_card_brand 구조 내보내기
DROP TABLE IF EXISTS `t_card_brand`;
CREATE TABLE IF NOT EXISTS `t_card_brand` (
  `BRAND_SEQ` int(11) NOT NULL,
  `BRAND_NAME` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `BRAND_STATE` varchar(1) CHARACTER SET utf8mb4 DEFAULT 'Y',
  PRIMARY KEY (`BRAND_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 banksalard.t_card_brand:~18 rows (대략적) 내보내기
DELETE FROM `t_card_brand`;
INSERT INTO `t_card_brand` (`BRAND_SEQ`, `BRAND_NAME`, `BRAND_STATE`) VALUES
	(1, '국내전용', 'Y'),
	(2, 'VISA', 'Y'),
	(3, 'MASTER', 'Y'),
	(4, 'MAESTRO', 'Y'),
	(5, 'AMEX', 'Y'),
	(6, 'UNONPAY', 'Y'),
	(7, 'BC Global', 'Y'),
	(8, 'BC', 'Y'),
	(9, 'URS', 'Y'),
	(10, 'JCB', 'Y'),
	(11, 'K-World', 'Y'),
	(12, '채움', 'Y'),
	(13, 'S&', 'Y'),
	(14, 'DNERS', 'Y'),
	(15, 'CIRRUS', 'Y'),
	(16, 'LGLOBAL', 'Y'),
	(17, 'One Way', 'Y'),
	(18, 'UPI', 'Y');

-- 테이블 banksalard.t_card_company 구조 내보내기
DROP TABLE IF EXISTS `t_card_company`;
CREATE TABLE IF NOT EXISTS `t_card_company` (
  `CARD_COMPANY_SEQ` int(11) NOT NULL COMMENT 'PK',
  `CARD_COMPANY_NAME` varchar(200) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '카드회사 이름',
  `CARD_COMPANY_STATE` varchar(2) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'Y' COMMENT '카드회사 상태',
  PRIMARY KEY (`CARD_COMPANY_SEQ`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 banksalard.t_card_company:~10 rows (대략적) 내보내기
DELETE FROM `t_card_company`;
INSERT INTO `t_card_company` (`CARD_COMPANY_SEQ`, `CARD_COMPANY_NAME`, `CARD_COMPANY_STATE`) VALUES
	(1, '신한', 'Y'),
	(2, '현대', 'Y'),
	(3, 'IBK기업', 'Y'),
	(4, 'KB국민', 'Y'),
	(5, '롯데', 'Y'),
	(6, '삼성', 'Y'),
	(7, '하나', 'Y'),
	(8, '우리', 'Y'),
	(9, 'BC바로', 'Y'),
	(10, '현대백화점', 'Y');

-- 테이블 banksalard.t_card_mileage 구조 내보내기
DROP TABLE IF EXISTS `t_card_mileage`;
CREATE TABLE IF NOT EXISTS `t_card_mileage` (
  `MILEAGE_SEQ` int(11) NOT NULL COMMENT 'PK',
  `CARD_SEQ` int(11) NOT NULL COMMENT '카드 번호',
  `CARD_PRICE` int(11) NOT NULL COMMENT '카드 가격',
  `MILEAGE_VALUE` int(11) NOT NULL COMMENT '마일리지 가격',
  `MILEAGE_STATE` varchar(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'Y' COMMENT '삭제여부',
  `MILEAGE_INSTDATE` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT '카드 등록날짜',
  PRIMARY KEY (`MILEAGE_SEQ`) USING BTREE,
  KEY `CARD_SEQ` (`CARD_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 banksalard.t_card_mileage:~26 rows (대략적) 내보내기
DELETE FROM `t_card_mileage`;
INSERT INTO `t_card_mileage` (`MILEAGE_SEQ`, `CARD_SEQ`, `CARD_PRICE`, `MILEAGE_VALUE`, `MILEAGE_STATE`, `MILEAGE_INSTDATE`) VALUES
	(2, 71, 100000, 3000, 'Y', '2022-11-13 02:08:22'),
	(3, 71, 250000, 2000, 'N', '2022-11-13 02:08:28'),
	(4, 70, 100000, 6000, 'Y', '2022-11-13 02:08:39'),
	(8, 68, 100000, 7000, 'Y', '2022-11-13 02:09:12'),
	(9, 67, 150000, 2000, 'Y', '2022-11-13 02:09:25'),
	(10, 66, 250000, 4000, 'Y', '2022-11-13 02:09:32'),
	(11, 65, 200000, 3000, 'N', '2022-11-13 02:09:36'),
	(12, 65, 300000, 4000, 'Y', '2022-11-13 02:09:41'),
	(13, 64, 200000, 10000, 'Y', '2022-11-13 02:09:48'),
	(14, 63, 300000, 2000, 'Y', '2022-11-13 02:09:54'),
	(15, 62, 100000, 1000, 'N', '2022-11-13 02:09:58'),
	(16, 62, 100000, 3000, 'Y', '2022-11-13 02:10:07'),
	(17, 61, 100000, 3000, 'Y', '2022-11-13 02:10:18'),
	(18, 60, 250000, 4000, 'Y', '2022-11-13 02:10:24'),
	(19, 59, 200000, 15000, 'Y', '2022-11-13 02:10:29'),
	(20, 58, 100000, 3000, 'Y', '2022-11-13 02:10:38'),
	(21, 57, 150000, 3000, 'Y', '2022-11-13 02:10:46'),
	(22, 56, 250000, 9000, 'Y', '2022-11-13 02:10:55'),
	(23, 55, 150000, 5000, 'Y', '2022-11-13 02:11:02'),
	(24, 54, 100000, 30000, 'Y', '2022-11-13 02:11:13'),
	(25, 53, 150000, 5000, 'Y', '2022-11-13 02:11:20'),
	(26, 52, 150000, 5000, 'Y', '2022-11-13 02:11:27'),
	(27, 69, 150000, 4000, 'Y', '2022-11-13 02:12:24');

-- 테이블 banksalard.t_card_type 구조 내보내기
DROP TABLE IF EXISTS `t_card_type`;
CREATE TABLE IF NOT EXISTS `t_card_type` (
  `CARD_TYPE_SEQ` int(11) NOT NULL COMMENT 'PK',
  `CARD_TYPE_NAME` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '카드타입 이름',
  `CARD_TYPE_STATE` varchar(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'Y' COMMENT '카드타입 상태',
  PRIMARY KEY (`CARD_TYPE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 banksalard.t_card_type:~3 rows (대략적) 내보내기
DELETE FROM `t_card_type`;
INSERT INTO `t_card_type` (`CARD_TYPE_SEQ`, `CARD_TYPE_NAME`, `CARD_TYPE_STATE`) VALUES
	(1, '신용', 'Y'),
	(2, '체크', 'Y'),
	(3, '하이브리드', 'Y');

-- 테이블 banksalard.t_member 구조 내보내기
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE IF NOT EXISTS `t_member` (
  `MEMBER_SEQ` int(11) NOT NULL COMMENT 'PK',
  `MEMBER_ID` varchar(15) CHARACTER SET utf8mb3 NOT NULL COMMENT '아이디',
  `MEMBER_PASSWORD` varchar(100) CHARACTER SET utf8mb3 NOT NULL COMMENT '비밀번호',
  `MEMBER_CATEGORY` varchar(45) CHARACTER SET utf8mb3 NOT NULL COMMENT '관리자,에디터,일반',
  `MEMBER_NICKNAME` varchar(20) CHARACTER SET utf8mb3 NOT NULL COMMENT '별명',
  `MEMBER_PHONE` varchar(13) CHARACTER SET utf8mb3 NOT NULL COMMENT '핸드폰 번호',
  `MEMBER_STATE` varchar(2) CHARACTER SET utf8mb3 NOT NULL DEFAULT 'Y' COMMENT '상태',
  `MEMBER_INSTDATE` varchar(10) CHARACTER SET utf8mb3 NOT NULL COMMENT '가입날짜',
  `MEMBER_IMAGE` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL COMMENT '프로필 이미지 이름',
  `MEMBER_LASTLOGIN` varchar(15) CHARACTER SET utf8mb3 NOT NULL COMMENT '마지막 로그인 날짜',
  PRIMARY KEY (`MEMBER_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 banksalard.t_member:~15 rows (대략적) 내보내기
DELETE FROM `t_member`;
INSERT INTO `t_member` (`MEMBER_SEQ`, `MEMBER_ID`, `MEMBER_PASSWORD`, `MEMBER_CATEGORY`, `MEMBER_NICKNAME`, `MEMBER_PHONE`, `MEMBER_STATE`, `MEMBER_INSTDATE`, `MEMBER_IMAGE`, `MEMBER_LASTLOGIN`) VALUES
	(1, 'admin', 'admin', '관리자', '관리자', '010-0000-0000', 'Y', '1900-01-01', 'Admin.png', '2022-11-14'),
	(2, 'editor1', '12345', '에디터', '멘탈이대머리', '010-1561-4102', 'Y', '2022-10-10', '프로필1.png', '2022-11-08'),
	(3, 'editor2', '12345', '에디터', '요조숙녀', '010-7845-4813', 'Y', '2022-11-5', '프로필2.png', '2022-11-08'),
	(4, 'editor3', '12345', '에디터', '안드로이드', '010-4813-4515', 'Y', '2018-10-01', '프로필3.png', '2022-11-08'),
	(5, 'editor4', '12345', '에디터', '아이폰최고', '010-1231-7445', 'Y', '2015-11-12', '프로필4.png', '2022-11-08'),
	(6, 'editor5', '12345', '에디터', 'NullPoint윽', '010-4894-4451', 'Y', '2011-10-01', '프로필5.png', '2022.08.15'),
	(7, 'editor6', '56789', '에디터', '가슴아파도', '010-1267-1121', 'N', '2000-11-15', NULL, '2022-11-08'),
	(8, 'editor7', '56789', '에디터', '닉네임입니다', '010-7144-1165', 'N', '2013-04-13', NULL, '2020.12.12'),
	(9, 'editor8', '56789', '에디터', '맙소사', '010-4443-1235', 'Y', '2011-10-12', NULL, '2021.12.12'),
	(10, 'editor9', '56789', '에디터', '개발을해보자', '010-1561-4444', 'N', '2019-11-20', NULL, '2022.09.15'),
	(11, 'editor10', '5467', '에디터', '순간포착', '010-1526-4112', 'Y', '2012-11-20', NULL, '2011-11.11'),
	(12, 'editor11', '45615', '에디터', '모기싫어', '010-1231-1214', 'N', '2011-11-11', NULL, '2011-11-11'),
	(13, 'editor12', '45615', '일반', '모기싫어', '010-1231-1214', 'N', '2011-11-11', NULL, '2022-10-15'),
	(14, 'editor13', '45615', '일반', '모기싫어', '010-1231-1214', 'N', '2011-11-11', NULL, '2011-11-11'),
	(15, 'common1', '45615', '일반', '모기싫어', '010-1231-1214', 'N', '2011-11-11', NULL, '2011-11-11');

-- 테이블 banksalard.t_place_mst 구조 내보내기
DROP TABLE IF EXISTS `t_place_mst`;
CREATE TABLE IF NOT EXISTS `t_place_mst` (
  `PLACE_MST_SEQ` int(11) NOT NULL COMMENT 'PK',
  `PLACE_TYPE` varchar(40) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '가게 분류',
  `PLACE_NAME` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '가게이름',
  `PLACE_STATE` varchar(2) CHARACTER SET utf8mb4 DEFAULT 'Y' COMMENT '가게 사용여부',
  `PLACE_IMAGE` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '브랜드 이미지',
  PRIMARY KEY (`PLACE_MST_SEQ`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 banksalard.t_place_mst:~18 rows (대략적) 내보내기
DELETE FROM `t_place_mst`;
INSERT INTO `t_place_mst` (`PLACE_MST_SEQ`, `PLACE_TYPE`, `PLACE_NAME`, `PLACE_STATE`, `PLACE_IMAGE`) VALUES
	(1, '대중교통', '카카오 T 택시', 'Y', 'bank.png'),
	(2, '대중교통', '버스', 'Y', 'bus.png'),
	(3, '대중교통', '지하철', 'Y', 'metro.png'),
	(4, '대중교통', '택시', 'Y', 'taxi.png'),
	(5, '대중교통', 'T-money충전', 'Y', 'tmoney.png'),
	(6, '대중교통', '카카오 t 블랙', 'Y', 'kakaot.png'),
	(7, '휴대폰요금', 'SK텔레콤', 'Y', 'sk.png'),
	(8, '휴대폰요금', 'KT', 'Y', 'kt.png'),
	(9, '휴대폰요금', 'LG유플러스', 'Y', 'lg.png'),
	(10, '카페', '스타벅스', 'Y', 'star.png'),
	(11, '카페', '투썸플레이스', 'Y', 'twosome.png'),
	(12, '카페', '이디야커피', 'Y', 'ediya.png'),
	(13, '영화', 'CGV', 'Y', 'cgv.png'),
	(14, '영화', '롯데시네마', 'Y', 'lotte.png'),
	(15, '영화', '메가박스', 'Y', 'mega.png'),
	(16, '대형마트', '이마트', 'Y', 'emart.png'),
	(17, '대형마트', '홈플러스', 'Y', 'homeplus.png'),
	(18, '대형마트', '롯데마트', 'Y', 'lottemart.png');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;