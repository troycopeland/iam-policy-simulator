# 🛡️ IAM Policy Simulator: Detect Over-Permissive Policies

This project uses the AWS IAM Policy Simulator to identify dangerous permissions in a deliberately over-permissive IAM policy.

---

## 🔍 What It Does

- Deploys an IAM policy with wildcard `*` actions and resources  
- Uses the AWS CLI to run policy simulation tests  
- Identifies and highlights allowed risky actions (e.g., `s3:DeleteObject`, `iam:PassRole`)  
- Demonstrates how AWS policy simulation can detect privilege escalation or misconfigurations

---

## ⚙️ Usage

1. Replace `'YOUR_ACCOUNT_ID'` in `main.tf` with your actual 12-digit AWS Account ID  
2. Deploy:

```hcl
terraform init
terraform apply
```

3. Run the simulator:

```bash
aws iam simulate-principal-policy \
  --policy-source-arn arn:aws:iam::YOUR_ACCOUNT_ID:role/simulator-role \
  --action-names s3:DeleteObject s3:PutObject iam:PassRole ec2:StartInstances \
  --output json | less
```

This will return a JSON evaluation showing which actions are allowed by the IAM policy.

---

## 🧠 Why It Matters

Over-permissive IAM policies are one of the most common causes of privilege escalation and security breaches in AWS environments.  
By using the IAM Policy Simulator proactively, you can detect and correct risky permissions before they become vulnerabilities.