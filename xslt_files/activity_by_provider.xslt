<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <body>
                <h2>Detailed Upcoming Activities by Provider</h2>
                <xsl:for-each select="platform/people/providers/provider">
                    <div style="margin-bottom: 20px;">
                        <!-- Provider Header -->
                        <h3>Provider: <xsl:value-of select="name"/></h3>
                        <p>
                            <strong>Role:</strong> <xsl:value-of select="role"/> <br/>
                            <strong>Experience:</strong> <xsl:value-of select="experience"/> <br/>
                            <strong>Email:</strong> <xsl:value-of select="contactInfo/email"/> <br/>
                            <strong>Phone:</strong> <xsl:value-of select="contactInfo/phone"/>
                        </p>
                        <!-- Activities Table -->
                        <xsl:choose>
                            <xsl:when test="/platform/activities/activity[provider_id=current()/@provider_id and status='Scheduled']">
                                <table border="1" cellspacing="0" cellpadding="5" style="border-collapse: collapse; width: 100%;">
                                    <thead>
                                        <tr style="background-color: #f2f2f2;">
                                            <th>Activity Name</th>
                                            <th>Scheduled Start</th>
                                            <th>Scheduled End</th>
                                            <th>Location</th>
                                            <th>Participants</th>
                                            <th>Description</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <xsl:for-each select="/platform/activities/activity[provider_id=current()/@provider_id and status='Scheduled']">
                                            <tr>
                                                <td><xsl:value-of select="name"/></td>
                                                <td><xsl:value-of select="scheduledStart"/></td>
                                                <td><xsl:value-of select="scheduledEnd"/></td>
                                                <td>
                                                    <xsl:value-of select="location/name"/><br/>
                                                    <xsl:value-of select="location/address/street"/>,
                                                    <xsl:value-of select="location/address/city"/>,
                                                    <xsl:value-of select="location/address/region"/>,
                                                    <xsl:value-of select="location/address/postalCode"/>
                                                    (<xsl:value-of select="location/address/country"/>)
                                                </td>
                                                <td>
                                                    <xsl:value-of select="capacity/currentParticipants"/>
                                                    /
                                                    <xsl:value-of select="capacity/maxParticipants"/>
                                                </td>
                                                <td><xsl:value-of select="description"/></td>
                                            </tr>
                                        </xsl:for-each>
                                    </tbody>
                                </table>
                            </xsl:when>
                            <xsl:otherwise>
                                <p><em>No upcoming activities scheduled for this provider.</em></p>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
