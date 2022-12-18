package kr.soft.bankCard.Admin.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.soft.bankCard.VO.BenefitVO;
import kr.soft.bankCard.VO.CardVO;
import kr.soft.bankCard.VO.MileageVO;
import kr.soft.bankCard.VO.PagingVO;

public interface CardService {

  //카드 등록하기
  int InsertCard(HttpServletRequest request, MultipartFile multipartFile, CardVO cardVO);

  // 카드 정보 List 총 갯수
  int cardCount();
  
  // 카드 정보 카드이름 검색 총 갯수
  int cardNameCount(String cardName);
  
  // 카드 정보 카드사 검색 총 갯수
  int cardCompanyCount(String cardCompany);
  
  //카드 정보 List 출력하기
  List<CardVO> SelectCardList(PagingVO pagingVO);
  
  // 카드 정보 이름 검색 List 출력하기
  List<CardVO> selectCardNameList(PagingVO pagingVO);
  
  // 카드사 검색 List 출력하기
  List<CardVO> selectCardCompanyList(PagingVO pagingVO);

  //카드 혜택정보 불러오기
  List<BenefitVO> SelectBenefitList(BenefitVO benefitVO);

  //z카드 혜택 삭제하기
  int deleteBenefit(BenefitVO benefitVO);

  //카드 적립 / 혜택 등록하기
  int InsertBenefit(BenefitVO benefitVO);

  //카드 마일리지 등록하기
  int InsertMileage(MileageVO mileageVO);

  //카드 마일리지 불러오기
  List<MileageVO> SelectMileageList(MileageVO mileageVO);

  //카드 마일리지 삭제하기
  int DeleteMileage(MileageVO mileageVO);


  CardVO selectCardDetail(CardVO cardVO);
  
  void cardState(int cardSeq);
}
