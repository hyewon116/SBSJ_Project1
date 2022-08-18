package kr.co.sbsj.delivery;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeliveryDAO {

	@Autowired
	private SqlSession sqlSession;

	public int delete( DeliveryDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("DeliveryMapper.delete", dto);
		return successCount;
	}//delete

	public int insert( DeliveryDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("DeliveryMapper.insert", dto);
		return successCount;
	}//insert

	public List<DeliveryDTO> list( String member_id ) {
		List<DeliveryDTO> list = null;
		list = sqlSession.selectList("DeliveryMapper.list", member_id);
		return list;
	}//list

}//class
