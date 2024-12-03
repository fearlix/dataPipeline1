<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- This XSLT stylesheet transforms XML data to generate an HTML report of upcoming activities for each provider. It displays provider details such as name, role, experience, and contact information, and lists scheduled activities with their details (name, time, location, participants, and description). If no activities are scheduled, a message is displayed.-->
    <!-- Define output method as HTML -->
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <body>
                <h2>Detailed Upcoming Activities by Provider</h2>

                <!-- Loop through each provider -->
                <xsl:for-each select="platform/people/providers/provider">
                    <div style="margin-bottom: 20px;">
                        <!-- Provider information header -->
                        <h3>Provider: <xsl:value-of select="name"/></h3>
                        <p>
                            <!-- Display provider's role -->
                            <strong>Role:</strong> <xsl:value-of select="role"/> <br/>
                            <!-- Display provider's experience -->
                            <strong>Experience:</strong> <xsl:value-of select="experience"/> <br/>
                            <!-- Display provider's contact email -->
                            <strong>Email:</strong> <xsl:value-of select="contactInfo/email"/> <br/>
                            <!-- Display provider's contact phone -->
                            <strong>Phone:</strong> <xsl:value-of select="contactInfo/phone"/>
                        </p>

                        <!-- Conditional display of activities -->
                        <xsl:choose>
                            <!-- If provider has scheduled activities -->
                            <xsl:when test="/platform/activities/activity[provider_id=current()/@provider_id and status='Scheduled']">
                                <table border="1" cellspacing="0" cellpadding="5" style="border-collapse: collapse; width: 100%;">
                                    <!-- Table header -->
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
                                        <!-- Loop through activities related to this provider -->
                                        <xsl:for-each select="/platform/activities/activity[provider_id=current()/@provider_id and status='Scheduled']">
                                            <tr>
                                                <!-- Activity name -->
                                                <td><xsl:value-of select="name"/></td>
                                                <!-- Scheduled start time -->
                                                <td><xsl:value-of select="scheduledStart"/></td>
                                                <!-- Scheduled end time -->
                                                <td><xsl:value-of select="scheduledEnd"/></td>
                                                <!-- Activity location details -->
                                                <td>
                                                    <xsl:value-of select="location/name"/><br/>
                                                    <xsl:value-of select="location/address/street"/>,
                                                    <xsl:value-of select="location/address/city"/>,
                                                    <xsl:value-of select="location/address/region"/>,
                                                    <xsl:value-of select="location/address/postalCode"/>
                                                    (<xsl:value-of select="location/address/country"/>)
                                                </td>
                                                <!-- Participants information -->
                                                <td>
                                                    <xsl:value-of select="capacity/currentParticipants"/>
                                                    /
                                                    <xsl:value-of select="capacity/maxParticipants"/>
                                                </td>
                                                <!-- Activity description -->
                                                <td><xsl:value-of select="description"/></td>
                                            </tr>
                                        </xsl:for-each>
                                    </tbody>
                                </table>
                            </xsl:when>
                            <!-- If no scheduled activities are available for this provider -->
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
