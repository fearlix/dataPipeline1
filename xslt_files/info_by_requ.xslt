<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <body>
                <h2>Detailed Information for Requestors</h2>
                <table border="1" cellpadding="5" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Requestor ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Age</th>
                            <th>Medical Needs</th>
                            <th>Language</th>
                            <th>Gender Preference</th>
                            <th>Pet Tolerance</th>
                            <th>Emergency Contacts</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="platform/people/requestors/requestor">
                            <tr>
                                <!-- Requestor Basic Info -->
                                <td><xsl:value-of select="@requestor_id"/></td>
                                <td><xsl:value-of select="name"/></td>
                                <td><xsl:value-of select="info/contact/email"/></td>
                                <td><xsl:value-of select="info/contact/phone"/></td>
                                <td><xsl:value-of select="info/age"/></td>
                                <td><xsl:value-of select="info/medicalNeeds"/></td>
                                <!-- Preferences -->
                                <td><xsl:value-of select="preferences/language"/></td>
                                <td><xsl:value-of select="preferences/genderPreference"/></td>
                                <td><xsl:value-of select="preferences/petTolerance"/></td>
                                <!-- Emergency Contacts -->
                                <td>
                                    <ul>
                                        <xsl:for-each select="emergencyContacts/contact">
                                            <li>
                                                <strong><xsl:value-of select="name"/></strong>
                                                (<xsl:value-of select="relationship"/>):
                                                <xsl:value-of select="phone"/>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
