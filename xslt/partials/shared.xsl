<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    
    exclude-result-prefixes="xs"
    version="2.0">
    <!--xsl:function name="local:makeId" as="xs:string">
        <xsl:param name="currentNode" as="node()"/>
        <xsl:variable name="nodeCurrNr">
            <xsl:value-of select="count($currentNode//preceding-sibling::*) + 1"/>
        </xsl:variable>
        <xsl:value-of select="concat(name($currentNode), '__', $nodeCurrNr)"/>
    </xsl:function-->  
    <xsl:template match="tei:pb">
        <span class="pb" source="{@facs}"><xsl:value-of select="./@n"/></span>
    </xsl:template>
    <xsl:template match="tei:date">
        <span class="date"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="tei:lb">
        <br />
    </xsl:template>
    <xsl:template match="tei:div">
        <div style="margin-top: 20px;"><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="tei:list[@type='unordered']">
        <xsl:choose>
            <xsl:when test="ancestor::tei:body">
                <ul class="yes-index">
                    <xsl:apply-templates/>
                </ul>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:item">
        <xsl:choose>
            <xsl:when test="parent::tei:list[@type='unordered']|ancestor::tei:body">
                <li><xsl:apply-templates/></li>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:ref">
        <a class="ref {@type}" href="{@target}"><xsl:apply-templates/></a>
    </xsl:template>
    <xsl:template match="tei:p">
       <p/>
    </xsl:template>
    <xsl:template match="tei:head">
        <h1 style="font-size:20px;strong;text-align:center"><xsl:apply-templates/></h1>
    </xsl:template>
    <xsl:template match="tei:head[@type='h2']">
        <h2 style="font-size:18px;text-align:center"><xsl:apply-templates/></h2>
    </xsl:template>
    <xsl:template match="tei:head[@type='h3']">
        <h3 style="font-size:16px;text-align:center"><xsl:apply-templates/></h3>
    </xsl:template>
    <xsl:template match="tei:table">
        <xsl:element name="table">
            <xsl:attribute name="class">
                <xsl:text>table table-bordered table-striped table-condensed table-hover</xsl:text>
            </xsl:attribute>
            <xsl:element name="tbody">
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:row">
        <xsl:element name="tr">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:cell">
        <xsl:element name="td">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:persName">
        <span class="persons entity" data-bs-toggle="modal">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:placeName">
        <span class="places entity" data-bs-toggle="modal">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:listPerson">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:person">
        <xsl:param name="showNumberOfMentions" as="xs:integer" select="5" />
        <xsl:variable name="selfLink">
            <xsl:value-of select="concat(data(@xml:id), '.html')"/>
        </xsl:variable>
        <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{concat(./tei:persName[1]/tei:surname[1], ', ', ./tei:persName[1]/tei:forename[1])}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="concat(./tei:persName[1]/tei:surname[1], ', ', ./tei:persName[1]/tei:forename[1])"/></h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <tbody>
                                <xsl:if test="./tei:idno[@type='WIKIDATA']">
                                <tr>
                                    <th>
                                        Wikidata ID
                                    </th>
                                    <td>
                                        <a href="{./tei:idno[@type='WIKIDATA']}" target="_blank">
                                            <xsl:value-of select="tokenize(./tei:idno[@type='WIKIDATA'], '/')[last()]"/>
                                        </a>
                                    </td>
                                </tr>
                                </xsl:if>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="tei:listPlace">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:place">
        <xsl:param name="showNumberOfMentions" as="xs:integer" select="5" />
        <xsl:variable name="selfLink">
            <xsl:value-of select="concat(data(@xml:id), '.html')"/>
        </xsl:variable>
        <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{(./tei:placeName)}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="(./tei:placeName)"/></h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table>
                            <tbody>
                                <xsl:if test="./tei:idno[@type='WIKIDATA']/text()">
                                    <tr>
                                        <th>
                                            Wikidata
                                        </th>
                                        <td>
                                            <a href="{./tei:idno[@type='WIKIDATA']}" target="_blank">
                                                <xsl:value-of select="tokenize(./tei:idno[@type='WIKIDATA'], '/')[last()]"/>
                                            </a>
                                        </td>
                                    </tr>
                                </xsl:if>
                                <xsl:if test="./tei:idno[@type='GEONAMES']/text()">
                                    <tr>
                                        <th>
                                            Geonames
                                        </th>
                                        <td>
                                            <a href="{./tei:idno[@type='GEONAMES']}" target="_blank">
                                                <xsl:value-of select="tokenize(./tei:idno[@type='GEONAMES'], '/')[4]"/>
                                            </a>
                                        </td>
                                    </tr>
                                </xsl:if>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>  
</xsl:stylesheet>
