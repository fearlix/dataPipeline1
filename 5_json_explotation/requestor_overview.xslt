<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Define output as text for generating JSON -->
    <xsl:output method="text" indent="yes"/>

    <!-- Main template that matches the root element -->
    <xsl:template match="/">
        {
        "requestors": [
        <!-- Loop through each requestor in the requestors section -->
        <xsl:for-each select="platform/people/requestors/requestor">
            {
            <!-- Extract requestor ID -->
            "id": "<xsl:value-of select="@requestor_id"/>",
            <!-- Extract requestor name -->
            "name": "<xsl:value-of select="name"/>",
            <!-- Extract requestor email -->
            "email": "<xsl:value-of select="info/contact/email"/>",
            "activities": [
            <!-- Loop through activities linked to the current requestor -->
            <xsl:for-each select="/platform/activities/activity[requestor_ids/requestor_id=current()/@requestor_id]">
                {
                <!-- Extract activity name -->
                "name": "<xsl:value-of select="name"/>",
                <!-- Extract scheduled start time -->
                "scheduledStart": "<xsl:value-of select="scheduledStart"/>",
                <!-- Extract scheduled end time -->
                "scheduledEnd": "<xsl:value-of select="scheduledEnd"/>",
                <!-- Extract activity location -->
                "location": "<xsl:value-of select="location/name"/>"
                }
                <!-- Add a comma if this is not the last activity -->
                <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ],
            "services": [
            <!-- Loop through services linked to the current requestor -->
            <xsl:for-each select="/platform/services/service[requestor_id=current()/@requestor_id]">
                {
                <!-- Extract service name -->
                "name": "<xsl:value-of select="name"/>",
                <!-- Extract scheduled start time -->
                "scheduledStart": "<xsl:value-of select="scheduledStart"/>",
                <!-- Extract scheduled end time -->
                "scheduledEnd": "<xsl:value-of select="scheduledEnd"/>",
                <!-- Extract provider name linked to the service -->
                "provider": "<xsl:value-of select="/platform/people/providers/provider[@provider_id=current()/provider_id]/name"/>"
                }
                <!-- Add a comma if this is not the last service -->
                <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ],
            "feedback": [
            <!-- Loop through feedback linked to the current requestor -->
            <xsl:for-each select="/platform/feedbacks/feedback[requestor_id=current()/@requestor_id]">
                {
                <!-- Extract feedback type (Service or Activity) -->
                "type": "<xsl:value-of select="@feedbackType"/>",
                <!-- Extract feedback rating -->
                "rating": <xsl:value-of select="rating"/>,
                <!-- Extract feedback comments -->
                "comments": "<xsl:value-of select="comments"/>"
                }
                <!-- Add a comma if this is not the last feedback -->
                <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ]
            }
            <!-- Add a comma if this is not the last requestor -->
            <xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
        ]
        }
    </xsl:template>
</xsl:stylesheet>
