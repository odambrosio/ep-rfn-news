<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<jcr:nodeProperty node="${currentNode}" name="jcr:title" var="newsTitle"/>
<jcr:nodeProperty node="${currentNode}" name="categories" var="newsCategories"/>
<jcr:nodeProperty node="${currentNode}" name="multimediaTag" var="newsMultimediaTag"/>
<jcr:nodeProperty node="${currentNode}" name="publicationDate" var="newsPublicationDate"/>
<jcr:nodeProperty node="${currentNode}" name="introParagraph" var="newsIntroParagraph"/>


<div class="news-list-entry">
  <div class="multimedia-element">
<%-- TODO : Filtre qui récupère le tag multimedia et affiche l'élément --%>
    <c:if test="${not empty newsMultimediaTag}">
      ${newsMultimediaTag.string}
  	</c:if>
  </div>
  <div class="news-list-description">
    <h2>
      <c:if test="${not empty newsTitle}">
        <c:url var="newsDetailUrl" value="${currentNode.url}" />
        <a title="${newsTitle.string}" href="${newsDetailUrl}">
          ${newsTitle.string}
        </a>
      </c:if>
    </h2>
    <div class="category">
      <c:if test="${not empty newsCategories}">
		${newsCategories[0].node.displayableName}
      </c:if>
    </div>
    <div class="date">
      <c:if test="${not empty newsPublicationDate}">
      	<fmt:formatDate pattern="dd.MM.yyyy" value="${newsPublicationDate.date.time}"/>
      </c:if>
    </div>
    <c:if test="${not empty newsIntroParagraph}">
      ${newsIntroParagraph.string}
  	</c:if>
  </div>
</div>