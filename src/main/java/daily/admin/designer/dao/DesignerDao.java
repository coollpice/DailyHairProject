package daily.admin.designer.dao;

import java.util.*;

import daily.admin.designer.vo.DesignerVO;

public interface DesignerDao {

	public List<DesignerVO> designerList();

	public DesignerVO designerDetail(int des_num);

	public int insertDesigner(DesignerVO dvo);

	public int updateDesigner(DesignerVO dvo);

	public int deleteDesigner(int des_num);

}