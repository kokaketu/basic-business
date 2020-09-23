package com.kokaketu.bces.common.utils;

import org.springframework.cglib.beans.BeanCopier;
import org.springframework.cglib.beans.BeanMap;
import org.springframework.objenesis.ObjenesisStd;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * dto复制工具
 *
 * @author xy
 */
@SuppressWarnings("unused")
public final class BeanCopyUtil {
    private BeanCopyUtil() {
    }

    private static final ThreadLocal<ObjenesisStd> OBJENESIS_STD_THREAD_LOCAL = ThreadLocal.withInitial(ObjenesisStd::new);
    private static final ConcurrentHashMap<Class<?>, ConcurrentHashMap<Class<?>, BeanCopier>> CACHE = new ConcurrentHashMap<>();


    /**
     * Copy properties t.
     *
     * @param <T>    the type parameter
     * @param source the source
     * @param target the target
     * @return the t
     * @author xy
     * @date 2019年04月16日
     */
    public static <T> T copy(Object source, Class<T> target) {
        return copy(source, OBJENESIS_STD_THREAD_LOCAL.get().newInstance(target));
    }

    /**
     * Copy map to bean.
     *
     * @param <T>    the type parameter
     * @param source the source
     * @param target the target
     * @return the t
     * @author xy
     * @date 2019年04月16日
     */
    public static <T> T mapToBean(Map<?, ?> source, Class<T> target) {
        T bean = OBJENESIS_STD_THREAD_LOCAL.get().newInstance(target);
        BeanMap beanMap = BeanMap.create(bean);
        beanMap.putAll(source);
        return bean;
    }

    /**
     * Copy bean to map.
     *
     * @param <T>    the type parameter
     * @param source the source
     * @return the t
     * @author xy
     * @date 2019年04月16日
     */
    public static <T> Map<?, ?> beanToMap(T source) {
        return BeanMap.create(source);
    }

    /**
     * Copy properties t.
     *
     * @param <T>    the type parameter
     * @param source the source
     * @param target the target
     * @return the t
     * @author xy
     * @date 2019年04月16日
     */
    @SuppressWarnings("WeakerAccess")
    public static <T> T copy(Object source, T target) {
        if (source == null || target == null) {
            return null;
        }
        BeanCopier beanCopier = getCacheBeanCopier(source.getClass(), target.getClass());
        beanCopier.copy(source, target, null);
        return target;
    }

    private static <S, T> BeanCopier getCacheBeanCopier(Class<S> source, Class<T> target) {
        ConcurrentHashMap<Class<?>, BeanCopier> copierConcurrentHashMap = CACHE.computeIfAbsent(source, aClass -> new ConcurrentHashMap<>(16));
        return copierConcurrentHashMap.computeIfAbsent(target, aClass -> BeanCopier.create(source, target, false));
    }

    /**
     * Copy properties list list.
     *
     * @param <T>     the type parameter
     * @param sources the sources
     * @param target  the target
     * @return the list
     * @author xy
     * @date 2019年04月16日
     */
    public static <T> List<T> copyList(List<?> sources, Class<T> target) {
        if (sources == null || target == null || sources.isEmpty()) {
            return Collections.emptyList();
        }

        ArrayList<T> list = new ArrayList<>(sources.size());
        ObjenesisStd objenesisStd = OBJENESIS_STD_THREAD_LOCAL.get();
        for (Object source : sources) {
            if (source == null) {
                throw new IllegalArgumentException("拷贝实体不能为null");
            }
            T newInstance = objenesisStd.newInstance(target);
            BeanCopier beanCopier = getCacheBeanCopier(source.getClass(), target);
            beanCopier.copy(source, newInstance, null);
            list.add(newInstance);
        }
        return list;
    }

}
