package com.dao.admin;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.admin.Authority;

/**
 * Ȩ��ʵ����dao
 * @authorh hxc
 *
 */
@Repository
public interface AuthorityDao {
	public int add(Authority authority);
	public int deleteByRoleId(Long roleId);
	public List<Authority> findListByRoleId(Long roleId);
}
