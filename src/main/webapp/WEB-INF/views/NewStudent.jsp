<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>New Student</title>
  <style>
    :root{
      --bg: #f4f7fb;
      --card: #ffffff;
      --accent: #4f46e5;
      --accent-2: #7c3aed;
      --muted: #6b7280;
      --danger: #ef4444;
      --radius: 12px;
      --glass: rgba(255,255,255,0.6);
      font-family: Inter, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    }

    *{box-sizing:border-box}
    body{
      margin:0;
      min-height:100vh;
      display:flex;
      align-items:center;
      justify-content:center;
      background: linear-gradient(180deg,#eef2ff 0%, #f8fafc 60%);
      padding:24px;
      color: #111827;
    }

    .container{
      width:100%;
      max-width:760px;
      background:var(--card);
      border-radius:var(--radius);
      box-shadow: 0 8px 30px rgba(12, 20, 40, 0.08);
      overflow:hidden;
      display:grid;
      grid-template-columns: 1fr 420px;
      min-height:480px;
    }

    /* left panel - info */
    .hero{
      padding:36px;
      background: linear-gradient(180deg, rgba(79,70,229,0.06), rgba(124,58,237,0.03));
      display:flex;
      flex-direction:column;
      gap:18px;
      justify-content:center;
    }
    .hero h1{
      margin:0;
      font-size:22px;
      letter-spacing: -0.2px;
      color:var(--accent);
    }
    .hero p{ margin:0; color:var(--muted); font-size:14px; line-height:1.5 }

    /* form side */
    .form-wrap{
      padding:28px;
      display:flex;
      align-items:center;
      justify-content:center;
    }

    form{
      width:100%;
      max-width:380px;
    }

    .row{
      display:flex;
      gap:12px;
    }

    label{
      display:block;
      font-size:13px;
      color:#374151;
      margin-bottom:6px;
      font-weight:600;
    }

    .input, select{
      width:100%;
      padding:12px 14px;
      border-radius:10px;
      border:1px solid #e6e9ef;
      outline:none;
      font-size:14px;
      background:transparent;
      transition: box-shadow .12s, border-color .12s;
    }
    .input:focus, select:focus{
      box-shadow: 0 6px 18px rgba(99,102,241,0.12);
      border-color: rgba(99,102,241,0.8);
    }

    .form-group{ margin-bottom:14px; }

    .two-col .form-group{ flex:1 }

    .btn{
      display:inline-flex;
      align-items:center;
      justify-content:center;
      gap:8px;
      background: linear-gradient(90deg, var(--accent), var(--accent-2));
      color:white;
      border:none;
      padding:12px 16px;
      border-radius:10px;
      cursor:pointer;
      font-weight:600;
      font-size:15px;
      margin-top:8px;
      width:100%;
    }

    .btn:active{ transform:translateY(1px) }

    .muted-small{ font-size:13px; color:var(--muted); margin-top:8px }

    .foot{
      margin-top:14px;
      display:flex;
      gap:10px;
      align-items:center;
      justify-content:space-between;
    }

    .secondary{
      background:transparent;
      border:1px solid #e6e9ef;
      color: #374151;
      padding:10px 12px;
      border-radius:10px;
      cursor:pointer;
    }

    .error{
      color:var(--danger);
      font-size:13px;
      margin-top:8px;
    }

    /* password toggle */
    .pw-wrap{
      position:relative;
    }
    .pw-toggle{
      position:absolute;
      right:10px;
      top:50%;
      transform:translateY(-50%);
      border:none;
      background:transparent;
      cursor:pointer;
      font-size:13px;
      color:var(--muted);
      padding:6px;
    }

    /* responsive */
    @media (max-width:880px){
      .container{ grid-template-columns:1fr; min-height:unset }
      .hero{ padding:22px; text-align:center }
      .form-wrap{ padding:20px }
    }

  </style>
</head>
<body>

  <div class="container" role="region" aria-labelledby="new-student-title">
    <div class="hero" aria-hidden="false">
      <h1 id="new-student-title">Add New Student</h1>
      <p>Fill in the student details below. The form validates basic fields before sending. You can convert this HTML to JSP easily by changing inputs' `name` / `id` and the form `action`.</p>

      <ul style="margin:12px 0 0 18px;color:var(--muted);font-size:13px;line-height:1.6">
        <li>First &amp; last name</li>
        <li>Email &amp; secure password</li>
        <li>Batch name (text or you can change to <code>&lt;select&gt;</code>)</li>
      </ul>
    </div>

    <div class="form-wrap">
      <form id="newStudentForm" action="saveStudent" method="post" novalidate>
        <div class="row two-col" style="margin-bottom:12px">
          <div class="form-group">
            <label for="firstName">First name</label>
            <input class="input" id="firstName" name="firstName" type="text" placeholder="Enter first name" required minlength="2" />
            <div class="error" id="err-firstName" style="display:none"></div>
          </div>

          <div class="form-group">
            <label for="lastName">Last name</label>
            <input class="input" id="lastName" name="lastName" type="text" placeholder="Enter last name" required minlength="2" />
            <div class="error" id="err-lastName" style="display:none"></div>
          </div>
        </div>

        <div class="form-group">
          <label for="email">Email address</label>
          <input class="input" id="email" name="email" type="email" placeholder="example@student.com" required />
          <div class="error" id="err-email" style="display:none"></div>
        </div>

        <div class="form-group pw-wrap">
          <label for="password">Password</label>
          <input class="input" id="password" name="password" type="password" placeholder="Choose a strong password" required minlength="6" />
          <button type="button" class="pw-toggle" aria-label="Toggle password visibility" onclick="togglePassword()">Show</button>
          <div class="error" id="err-password" style="display:none"></div>
        </div>

        <div class="form-group">
          <label for="batchName">Batch name</label>
          <!-- You can replace the input below with a select if you have fixed batches -->
          <input class="input" id="batchName" name="batchName" type="text" placeholder="e.g. Android - Sep 2025" required />
          <div class="error" id="err-batchName" style="display:none"></div>
        </div>

        <button class="btn" type="submit">Create Student</button>

        <div class="foot">
          <div class="muted-small">Fields marked required are validated in browser.</div>
          <button type="button" class="secondary" onclick="resetForm()">Reset</button>
        </div>
      </form>
    </div>
  </div>

</body>
</html>
