<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <body>
                <!-- Page title -->
                <h2>Detailed Information for Requestors</h2>

                <!-- Table for displaying requestor information -->
                <table border="1" cellpadding="5" cellspacing="0">
                    <thead>
                        <tr>
                            <!-- Table column headers -->
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
                        <!-- Iterate over each requestor -->
                        <xsl:for-each select="platform/people/requestors/requestor">
                            <tr>
                                <!-- Requestor Basic Info -->
                                <td>
                                    <!-- Display the unique ID of the requestor -->
                                    <xsl:value-of select="@requestor_id"/>
                                </td>
                                <td>
                                    <!-- Display the name of the requestor -->
                                    <xsl:value-of select="name"/>
                                </td>
                                <td>
                                    <!-- Display the email of the requestor -->
                                    <xsl:value-of select="info/contact/email"/>
                                </td>
                                <td>
                                    <!-- Display the phone number of the requestor -->
                                    <xsl:value-of select="info/contact/phone"/>
                                </td>
                                <td>
                                    <!-- Display the age of the requestor -->
                                    <xsl:value-of select="info/age"/>
                                </td>
                                <td>
                                    <!-- Display the medical needs of the requestor -->
                                    <xsl:value-of select="info/medicalNeeds"/>
                                </td>
                                <!-- Preferences -->
                                <td>
                                    <!-- Display the preferred language of the requestor -->
                                    <xsl:value-of select="preferences/language"/>
                                </td>
                                <td>
                                    <!-- Display the gender preference of the requestor -->
                                    <xsl:value-of select="preferences/genderPreference"/>
                                </td>
                                <td>
                                    <!-- Display the pet tolerance of the requestor -->
                                    <xsl:value-of select="preferences/petTolerance"/>
                                </td>
                                <!-- Emergency Contacts -->
                                <td>
                                    <!-- List emergency contacts for the requestor -->
                                    <ul>
                                        <xsl:for-each select="emergencyContacts/contact">
                                            <li>
                                                <!-- Emergency contact name -->
                                                <strong><xsl:value-of select="name"/></strong>
                                                <!-- Relationship and phone number -->
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
