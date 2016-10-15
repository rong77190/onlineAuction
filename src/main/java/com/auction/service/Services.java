package com.auction.service;

import com.auction.model.PageBean;

import java.util.List;

public interface Services<E extends PageBean> {
	/**
	 * 添加
	 * 
	 * @param e
	 * @return
	 */
	public int insert(E e);

	/**
	 * 删除
	 * 
	 * @param e
	 * @return
	 */
	public int delete(E e);

	/**
	 * 批量删除
	 * 
	 * @param ids
	 * @return
	 */
	public int deletes(String[] ids);

	/**
	 * 修改
	 * 
	 * @param e
	 * @return
	 */
	public int update(E e);

	/**
	 * 查询一条记录
	 * 
	 * @param e
	 * @return
	 */
	public E selectOne(E e);
	
	/**
	 * 根据ID查询一条记录
	 * 
	 * @param e
	 * @return
	 */
	public E selectById(String id);

	/**
	 * 分页查询
	 * 
	 * @param e
	 * @return
	 */
	public PageBean selectPageList(E e);
	
	/**
	 * 根据条件查询所有
	 * @return
	 */
	public List<E> selectList(E e);
	
}
