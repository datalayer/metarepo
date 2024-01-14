"""
This module is used to update the copier context.
"""


from copier_templates_extensions import ContextHook


def extend_repos_answer(repo: str, use_ssh: bool) -> str:
    repo_prefix = "https://github.com/datalayer" if not use_ssh else "git@github.com:datalayer"

    if repo == "jupyter-ui":
        pass

    return f"{repo}|package/{repo}|{repo_prefix}/{repo}.git"


class ContextUpdater(ContextHook):
    update = False

    def hook(self, context):
        # Get user's answer to the "repos" and "ssh" questions
        repos = context["repos"]
        use_ssh = context["ssh"]

        context["extended_repos"] = [extend_repos_answer(repo, use_ssh) for repo in repos]
