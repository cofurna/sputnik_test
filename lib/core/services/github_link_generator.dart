class GithubLinkGenerator {
  static String gitHubUserUrl(String login, {String tab = ''}) {
    return 'https://github.com/$login$tab';
  }

  static String gitHubUserRepoUrl(String login) {
    return gitHubUserUrl(login, tab: '?tab=repositories');
  }

  static String gitHubUserFollowingUrl(String login) {
    return gitHubUserUrl(login, tab: '?tab=following');
  }

  static String gitHubUserFollowersUrl(String login) {
    return gitHubUserUrl(login, tab: '?tab=followers');
  }
}
