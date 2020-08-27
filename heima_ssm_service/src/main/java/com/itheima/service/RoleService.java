package com.itheima.service;

import com.itheima.domain.Permission;
import com.itheima.domain.Role;

import java.util.List;

public interface RoleService {
    List<Role> findAll(int page,int size) throws Exception;
    void save(Role role) throws Exception;
    Role findById(int id) throws Exception;
    List<Permission> findOtherPermissions(int roleId) throws Exception;

    void addPermissionToRole(String roleId,String[] permissionIds) throws Exception;

    void deleteRole(int id) throws Exception;
}
