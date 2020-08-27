package com.itheima.service;

import com.itheima.domain.Permission;

import java.util.List;

public interface PermissionService {
    List<Permission> findAll(int page,int size) throws Exception;
    void save(Permission permission) throws Exception;
    Permission findById(int id) throws Exception;
    void deletePermission(int id) throws Exception;

}
