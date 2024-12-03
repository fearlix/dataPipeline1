<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="yes"/>

    <xsl:template match="/">
        {
        "requestors": [
        <xsl:for-each select="platform/people/requestors/requestor">
            {
            "id": "<xsl:value-of select="@requestor_id"/>",
            "name": "<xsl:value-of select="name"/>",
            "email": "<xsl:value-of select="info/contact/email"/>",
            "activities": [
            <xsl:for-each select="/platform/activities/activity[requestor_ids/requestor_id=current()/@requestor_id]">
                {
                "name": "<xsl:value-of select="name"/>",
                "scheduledStart": "<xsl:value-of select="scheduledStart"/>",
                "scheduledEnd": "<xsl:value-of select="scheduledEnd"/>",
                "location": "<xsl:value-of select="location/name"/>"
                }
                <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ],
            "services": [
            <xsl:for-each select="/platform/services/service[requestor_id=current()/@requestor_id]">
                {
                "name": "<xsl:value-of select="name"/>",
                "scheduledStart": "<xsl:value-of select="scheduledStart"/>",
                "scheduledEnd": "<xsl:value-of select="scheduledEnd"/>",
                "provider": "<xsl:value-of select="/platform/people/providers/provider[@provider_id=current()/provider_id]/name"/>"
                }
                <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ],
            "feedback": [
            <xsl:for-each select="/platform/feedbacks/feedback[requestor_id=current()/@requestor_id]">
                {
                "type": "<xsl:value-of select="@feedbackType"/>",
                "rating": <xsl:value-of select="rating"/>,
                "comments": "<xsl:value-of select="comments"/>"
                }
                <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ]
            }
            <xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
        ]
        }
    </xsl:template>
</xsl:stylesheet>
