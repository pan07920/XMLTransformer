<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:d="ddn:cns-org:v5">
  <xsl:output method="text" omit-xml-declaration="yes" />
  <!-- 
    <xsl:template match="text()[normalize-space()]">
        <xsl:value-of select="." />
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
 -->

  <xsl:template match="text()[not(normalize-space())]" />

  <!-- Add a blank line after each section or paragraph-->
  <xsl:template match="d:section | d:paragraph">
    <xsl:apply-templates />
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

  <!-- 
        Format the contents in <content></content>
     -->
  <xsl:template match="d:content">
    <xsl:value-of select='normalize-space()'/>
  </xsl:template>

  <xsl:template match="d:title">
    <xsl:text>&#xA;&#xA;</xsl:text>
    <xsl:value-of
        select="translate(normalize-space(), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
    <xsl:if test="not( substring(., string-length(.),1)=':' )">
      <xsl:text>:</xsl:text>
    </xsl:if>
    <xsl:text>&#xA;&#xA;</xsl:text>
  </xsl:template>

</xsl:stylesheet>