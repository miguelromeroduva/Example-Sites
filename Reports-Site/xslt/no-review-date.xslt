<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:include href="/_cascade/formats/xslt/_common"/>
    <xsl:include href="site://_Common Resources/formats/xslt/format-date"/>
    <xsl:template match="/system-index-block/calling-page/system-page">
        <xsl:variable name="noReviewDate" select="system-data-structure/block/content/system-index-block//system-page[not(review-date)]"/>
        <div class="row">
            <div class="col-xs-12">
                <h1>
                    <xsl:value-of select="title"/>
                </h1>
                <p>
                    <xsl:text>Pages with no Review Date: </xsl:text>
                    <xsl:value-of select="count($noReviewDate)"/>
                </p>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-xs-12">
                <xsl:choose>
                    <xsl:when test="count($noReviewDate) &gt; 0">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover table-condensed" id="reportTable">
                                <thead>
                                    <tr>
                                        <th>Page</th>
                                        <th class="col-xs-1 actions">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:apply-templates select="$noReviewDate"/>
                                </tbody>
                            </table>
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>Nothing to show here. No pages without a Review Date were found.</p>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="system-page">
        <tr>
            <td>
                <a href="{link}">
                    <xsl:call-template name="chooseDisplay"/>
                </a>
                <xsl:text>&#160;</xsl:text>
                <small class="text-muted">
                    <xsl:value-of select="concat('[',path,']')"/>
                </small>
            </td>
            <td>
                <xsl:call-template name="cascadelink">
                    <xsl:with-param name="type">open</xsl:with-param>
                    <xsl:with-param name="pageID" select="@id"/>
                </xsl:call-template>
                <xsl:call-template name="cascadelink">
                    <xsl:with-param name="type">edit</xsl:with-param>
                    <xsl:with-param name="pageID" select="@id"/>
                </xsl:call-template>
                <xsl:call-template name="cascadelink">
                    <xsl:with-param name="type">publish</xsl:with-param>
                    <xsl:with-param name="pageID" select="@id"/>
                </xsl:call-template>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>