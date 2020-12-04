package com.news.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class NewsExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public NewsExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andNidIsNull() {
            addCriterion("nid is null");
            return (Criteria) this;
        }

        public Criteria andNidIsNotNull() {
            addCriterion("nid is not null");
            return (Criteria) this;
        }

        public Criteria andNidEqualTo(Integer value) {
            addCriterion("nid =", value, "nid");
            return (Criteria) this;
        }

        public Criteria andNidNotEqualTo(Integer value) {
            addCriterion("nid <>", value, "nid");
            return (Criteria) this;
        }

        public Criteria andNidGreaterThan(Integer value) {
            addCriterion("nid >", value, "nid");
            return (Criteria) this;
        }

        public Criteria andNidGreaterThanOrEqualTo(Integer value) {
            addCriterion("nid >=", value, "nid");
            return (Criteria) this;
        }

        public Criteria andNidLessThan(Integer value) {
            addCriterion("nid <", value, "nid");
            return (Criteria) this;
        }

        public Criteria andNidLessThanOrEqualTo(Integer value) {
            addCriterion("nid <=", value, "nid");
            return (Criteria) this;
        }

        public Criteria andNidIn(List<Integer> values) {
            addCriterion("nid in", values, "nid");
            return (Criteria) this;
        }

        public Criteria andNidNotIn(List<Integer> values) {
            addCriterion("nid not in", values, "nid");
            return (Criteria) this;
        }

        public Criteria andNidBetween(Integer value1, Integer value2) {
            addCriterion("nid between", value1, value2, "nid");
            return (Criteria) this;
        }

        public Criteria andNidNotBetween(Integer value1, Integer value2) {
            addCriterion("nid not between", value1, value2, "nid");
            return (Criteria) this;
        }

        public Criteria andAuthorIsNull() {
            addCriterion("author is null");
            return (Criteria) this;
        }

        public Criteria andAuthorIsNotNull() {
            addCriterion("author is not null");
            return (Criteria) this;
        }

        public Criteria andAuthorEqualTo(String value) {
            addCriterion("author =", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotEqualTo(String value) {
            addCriterion("author <>", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorGreaterThan(String value) {
            addCriterion("author >", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorGreaterThanOrEqualTo(String value) {
            addCriterion("author >=", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorLessThan(String value) {
            addCriterion("author <", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorLessThanOrEqualTo(String value) {
            addCriterion("author <=", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorLike(String value) {
            addCriterion("author like", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotLike(String value) {
            addCriterion("author not like", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorIn(List<String> values) {
            addCriterion("author in", values, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotIn(List<String> values) {
            addCriterion("author not in", values, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorBetween(String value1, String value2) {
            addCriterion("author between", value1, value2, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotBetween(String value1, String value2) {
            addCriterion("author not between", value1, value2, "author");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andNtextIsNull() {
            addCriterion("ntext is null");
            return (Criteria) this;
        }

        public Criteria andNtextIsNotNull() {
            addCriterion("ntext is not null");
            return (Criteria) this;
        }

        public Criteria andNtextEqualTo(String value) {
            addCriterion("ntext =", value, "ntext");
            return (Criteria) this;
        }

        public Criteria andNtextNotEqualTo(String value) {
            addCriterion("ntext <>", value, "ntext");
            return (Criteria) this;
        }

        public Criteria andNtextGreaterThan(String value) {
            addCriterion("ntext >", value, "ntext");
            return (Criteria) this;
        }

        public Criteria andNtextGreaterThanOrEqualTo(String value) {
            addCriterion("ntext >=", value, "ntext");
            return (Criteria) this;
        }

        public Criteria andNtextLessThan(String value) {
            addCriterion("ntext <", value, "ntext");
            return (Criteria) this;
        }

        public Criteria andNtextLessThanOrEqualTo(String value) {
            addCriterion("ntext <=", value, "ntext");
            return (Criteria) this;
        }

        public Criteria andNtextLike(String value) {
            addCriterion("ntext like", value, "ntext");
            return (Criteria) this;
        }

        public Criteria andNtextNotLike(String value) {
            addCriterion("ntext not like", value, "ntext");
            return (Criteria) this;
        }

        public Criteria andNtextIn(List<String> values) {
            addCriterion("ntext in", values, "ntext");
            return (Criteria) this;
        }

        public Criteria andNtextNotIn(List<String> values) {
            addCriterion("ntext not in", values, "ntext");
            return (Criteria) this;
        }

        public Criteria andNtextBetween(String value1, String value2) {
            addCriterion("ntext between", value1, value2, "ntext");
            return (Criteria) this;
        }

        public Criteria andNtextNotBetween(String value1, String value2) {
            addCriterion("ntext not between", value1, value2, "ntext");
            return (Criteria) this;
        }

        public Criteria andNtimeIsNull() {
            addCriterion("ntime is null");
            return (Criteria) this;
        }

        public Criteria andNtimeIsNotNull() {
            addCriterion("ntime is not null");
            return (Criteria) this;
        }

        public Criteria andNtimeEqualTo(Date value) {
            addCriterionForJDBCDate("ntime =", value, "ntime");
            return (Criteria) this;
        }

        public Criteria andNtimeNotEqualTo(Date value) {
            addCriterionForJDBCDate("ntime <>", value, "ntime");
            return (Criteria) this;
        }

        public Criteria andNtimeGreaterThan(Date value) {
            addCriterionForJDBCDate("ntime >", value, "ntime");
            return (Criteria) this;
        }

        public Criteria andNtimeGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("ntime >=", value, "ntime");
            return (Criteria) this;
        }

        public Criteria andNtimeLessThan(Date value) {
            addCriterionForJDBCDate("ntime <", value, "ntime");
            return (Criteria) this;
        }

        public Criteria andNtimeLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("ntime <=", value, "ntime");
            return (Criteria) this;
        }

        public Criteria andNtimeIn(List<Date> values) {
            addCriterionForJDBCDate("ntime in", values, "ntime");
            return (Criteria) this;
        }

        public Criteria andNtimeNotIn(List<Date> values) {
            addCriterionForJDBCDate("ntime not in", values, "ntime");
            return (Criteria) this;
        }

        public Criteria andNtimeBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("ntime between", value1, value2, "ntime");
            return (Criteria) this;
        }

        public Criteria andNtimeNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("ntime not between", value1, value2, "ntime");
            return (Criteria) this;
        }

        public Criteria andNtidIsNull() {
            addCriterion("ntid is null");
            return (Criteria) this;
        }

        public Criteria andNtidIsNotNull() {
            addCriterion("ntid is not null");
            return (Criteria) this;
        }

        public Criteria andNtidEqualTo(Integer value) {
            addCriterion("ntid =", value, "ntid");
            return (Criteria) this;
        }

        public Criteria andNtidNotEqualTo(Integer value) {
            addCriterion("ntid <>", value, "ntid");
            return (Criteria) this;
        }

        public Criteria andNtidGreaterThan(Integer value) {
            addCriterion("ntid >", value, "ntid");
            return (Criteria) this;
        }

        public Criteria andNtidGreaterThanOrEqualTo(Integer value) {
            addCriterion("ntid >=", value, "ntid");
            return (Criteria) this;
        }

        public Criteria andNtidLessThan(Integer value) {
            addCriterion("ntid <", value, "ntid");
            return (Criteria) this;
        }

        public Criteria andNtidLessThanOrEqualTo(Integer value) {
            addCriterion("ntid <=", value, "ntid");
            return (Criteria) this;
        }

        public Criteria andNtidIn(List<Integer> values) {
            addCriterion("ntid in", values, "ntid");
            return (Criteria) this;
        }

        public Criteria andNtidNotIn(List<Integer> values) {
            addCriterion("ntid not in", values, "ntid");
            return (Criteria) this;
        }

        public Criteria andNtidBetween(Integer value1, Integer value2) {
            addCriterion("ntid between", value1, value2, "ntid");
            return (Criteria) this;
        }

        public Criteria andNtidNotBetween(Integer value1, Integer value2) {
            addCriterion("ntid not between", value1, value2, "ntid");
            return (Criteria) this;
        }

        public Criteria andIsreviewIsNull() {
            addCriterion("isreview is null");
            return (Criteria) this;
        }

        public Criteria andIsreviewIsNotNull() {
            addCriterion("isreview is not null");
            return (Criteria) this;
        }

        public Criteria andIsreviewEqualTo(Integer value) {
            addCriterion("isreview =", value, "isreview");
            return (Criteria) this;
        }

        public Criteria andIsreviewNotEqualTo(Integer value) {
            addCriterion("isreview <>", value, "isreview");
            return (Criteria) this;
        }

        public Criteria andIsreviewGreaterThan(Integer value) {
            addCriterion("isreview >", value, "isreview");
            return (Criteria) this;
        }

        public Criteria andIsreviewGreaterThanOrEqualTo(Integer value) {
            addCriterion("isreview >=", value, "isreview");
            return (Criteria) this;
        }

        public Criteria andIsreviewLessThan(Integer value) {
            addCriterion("isreview <", value, "isreview");
            return (Criteria) this;
        }

        public Criteria andIsreviewLessThanOrEqualTo(Integer value) {
            addCriterion("isreview <=", value, "isreview");
            return (Criteria) this;
        }

        public Criteria andIsreviewIn(List<Integer> values) {
            addCriterion("isreview in", values, "isreview");
            return (Criteria) this;
        }

        public Criteria andIsreviewNotIn(List<Integer> values) {
            addCriterion("isreview not in", values, "isreview");
            return (Criteria) this;
        }

        public Criteria andIsreviewBetween(Integer value1, Integer value2) {
            addCriterion("isreview between", value1, value2, "isreview");
            return (Criteria) this;
        }

        public Criteria andIsreviewNotBetween(Integer value1, Integer value2) {
            addCriterion("isreview not between", value1, value2, "isreview");
            return (Criteria) this;
        }

        public Criteria andHotIsNull() {
            addCriterion("hot is null");
            return (Criteria) this;
        }

        public Criteria andHotIsNotNull() {
            addCriterion("hot is not null");
            return (Criteria) this;
        }

        public Criteria andHotEqualTo(Integer value) {
            addCriterion("hot =", value, "hot");
            return (Criteria) this;
        }

        public Criteria andHotNotEqualTo(Integer value) {
            addCriterion("hot <>", value, "hot");
            return (Criteria) this;
        }

        public Criteria andHotGreaterThan(Integer value) {
            addCriterion("hot >", value, "hot");
            return (Criteria) this;
        }

        public Criteria andHotGreaterThanOrEqualTo(Integer value) {
            addCriterion("hot >=", value, "hot");
            return (Criteria) this;
        }

        public Criteria andHotLessThan(Integer value) {
            addCriterion("hot <", value, "hot");
            return (Criteria) this;
        }

        public Criteria andHotLessThanOrEqualTo(Integer value) {
            addCriterion("hot <=", value, "hot");
            return (Criteria) this;
        }

        public Criteria andHotIn(List<Integer> values) {
            addCriterion("hot in", values, "hot");
            return (Criteria) this;
        }

        public Criteria andHotNotIn(List<Integer> values) {
            addCriterion("hot not in", values, "hot");
            return (Criteria) this;
        }

        public Criteria andHotBetween(Integer value1, Integer value2) {
            addCriterion("hot between", value1, value2, "hot");
            return (Criteria) this;
        }

        public Criteria andHotNotBetween(Integer value1, Integer value2) {
            addCriterion("hot not between", value1, value2, "hot");
            return (Criteria) this;
        }

        public Criteria andSrcIsNull() {
            addCriterion("src is null");
            return (Criteria) this;
        }

        public Criteria andSrcIsNotNull() {
            addCriterion("src is not null");
            return (Criteria) this;
        }

        public Criteria andSrcEqualTo(Integer value) {
            addCriterion("src =", value, "src");
            return (Criteria) this;
        }

        public Criteria andSrcNotEqualTo(Integer value) {
            addCriterion("src <>", value, "src");
            return (Criteria) this;
        }

        public Criteria andSrcGreaterThan(Integer value) {
            addCriterion("src >", value, "src");
            return (Criteria) this;
        }

        public Criteria andSrcGreaterThanOrEqualTo(Integer value) {
            addCriterion("src >=", value, "src");
            return (Criteria) this;
        }

        public Criteria andSrcLessThan(Integer value) {
            addCriterion("src <", value, "src");
            return (Criteria) this;
        }

        public Criteria andSrcLessThanOrEqualTo(Integer value) {
            addCriterion("src <=", value, "src");
            return (Criteria) this;
        }

        public Criteria andSrcIn(List<Integer> values) {
            addCriterion("src in", values, "src");
            return (Criteria) this;
        }

        public Criteria andSrcNotIn(List<Integer> values) {
            addCriterion("src not in", values, "src");
            return (Criteria) this;
        }

        public Criteria andSrcBetween(Integer value1, Integer value2) {
            addCriterion("src between", value1, value2, "src");
            return (Criteria) this;
        }

        public Criteria andSrcNotBetween(Integer value1, Integer value2) {
            addCriterion("src not between", value1, value2, "src");
            return (Criteria) this;
        }

        public Criteria andSourcetypeIsNull() {
            addCriterion("sourcetype is null");
            return (Criteria) this;
        }

        public Criteria andSourcetypeIsNotNull() {
            addCriterion("sourcetype is not null");
            return (Criteria) this;
        }

        public Criteria andSourcetypeEqualTo(String value) {
            addCriterion("sourcetype =", value, "sourcetype");
            return (Criteria) this;
        }

        public Criteria andSourcetypeNotEqualTo(String value) {
            addCriterion("sourcetype <>", value, "sourcetype");
            return (Criteria) this;
        }

        public Criteria andSourcetypeGreaterThan(String value) {
            addCriterion("sourcetype >", value, "sourcetype");
            return (Criteria) this;
        }

        public Criteria andSourcetypeGreaterThanOrEqualTo(String value) {
            addCriterion("sourcetype >=", value, "sourcetype");
            return (Criteria) this;
        }

        public Criteria andSourcetypeLessThan(String value) {
            addCriterion("sourcetype <", value, "sourcetype");
            return (Criteria) this;
        }

        public Criteria andSourcetypeLessThanOrEqualTo(String value) {
            addCriterion("sourcetype <=", value, "sourcetype");
            return (Criteria) this;
        }

        public Criteria andSourcetypeLike(String value) {
            addCriterion("sourcetype like", value, "sourcetype");
            return (Criteria) this;
        }

        public Criteria andSourcetypeNotLike(String value) {
            addCriterion("sourcetype not like", value, "sourcetype");
            return (Criteria) this;
        }

        public Criteria andSourcetypeIn(List<String> values) {
            addCriterion("sourcetype in", values, "sourcetype");
            return (Criteria) this;
        }

        public Criteria andSourcetypeNotIn(List<String> values) {
            addCriterion("sourcetype not in", values, "sourcetype");
            return (Criteria) this;
        }

        public Criteria andSourcetypeBetween(String value1, String value2) {
            addCriterion("sourcetype between", value1, value2, "sourcetype");
            return (Criteria) this;
        }

        public Criteria andSourcetypeNotBetween(String value1, String value2) {
            addCriterion("sourcetype not between", value1, value2, "sourcetype");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}