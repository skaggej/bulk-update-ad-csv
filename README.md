<p><strong>Project Description</strong><br />PowerShell script that updates AD objects based on a CSV schema.</p>
<p>First,&nbsp;a big thank you to <strong>Cary Landers</strong> and <strong>Nuno Mota</strong>.</p>
<p>This effort was adapted from:</p>
<ol>
<li><a href="https://companydirectory.codeplex.com/">https://companydirectory.codeplex.com/</a>&nbsp;by <a href="https://www.codeplex.com/site/users/view/carywlanders">Cary Landers</a></li>
<li><a href="https://gallery.technet.microsoft.com/scriptcenter/f7b246a4-95a2-4408-b1a1-73b53003883c">https://gallery.technet.microsoft.com/scriptcenter/f7b246a4-95a2-4408-b1a1-73b53003883c</a>&nbsp;by <a href="https://social.technet.microsoft.com/profile/nuno%20mota/">Nuno Mota</a></li>
</ol>
<p>This script does the following:</p>
<ul>
<li>Iterates through records in a CSV</li>
<li>For each record, looks up the AD object's distinguishedName based on the AccountName in the CSV</li>
<li>Updates the AD object based on the other properties specified in the CSV</li>
</ul>
<p>The project provides both the PowerShell script and a sample CSV.&nbsp; To test the script as-is, all you need to do is create three user objects in AD as <strong>testuser1</strong>, <strong>testuser2</strong>, and <strong>testuser3</strong> (view the CSV in Excel and refer to the first column).</p>
<p>Once you've created those three users, you should be able to run the script and be able to open the attribute editor for testuser1, testuser2, and testuser3 to see their updated values.</p>
<p><strong>Before running the script, we see that testuser3 has no address, city, state, or zip.</strong></p>
<p><img src="https://raw.githubusercontent.com/skaggej/bulk-update-ad-csv/master/screenshots/testuser3_before_2014-11-11_17-27-07.png" alt="Before running the script" width="425" height="563" /></p>
<p><strong>Here's an amazing capture of what happens when you run the script.</strong></p>
<p><img src="https://raw.githubusercontent.com/skaggej/bulk-update-ad-csv/master/screenshots/running_the_script_2014-11-11_17-28-44.png" alt="Running the script" width="600" height="180" /></p>
<p><strong>Finally, we check and see that testuser3 now lives somewhere!</strong></p>
<p><img src="https://raw.githubusercontent.com/skaggej/bulk-update-ad-csv/master/screenshots/testuser3_after_2014-11-11_17-27-07.png" alt="After the script has been run" width="425" height="563" /></p>
<p>Questions and comments are welcome:&nbsp; <a href="mailto:eskaggs@outlook.com">eskaggs@outlook.com</a>.</p>
