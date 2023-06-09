package cn.edu.nuc.ssm.service.interfaces;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Message;

public interface MessageService {

	/**保存留言
	 * @param message
	 * @return
	 */
	int savemess(Message message);

	/**列出留言信息
	 * @param current 当前页
	 * @return list
	 */
	PageInfo list(Integer current);

	int delete(int id);

	Message findByid(int id);

}
