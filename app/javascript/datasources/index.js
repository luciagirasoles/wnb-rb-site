const API_ROOT = '/api';

export const getPastMeetups = async () => {
    const result = await fetch(`${API_ROOT}/events/past`);
    const json = await result.json();
    return json.data;
};

export const getJobs = async () => {
    const result = await fetch(`${API_ROOT}/jobs`);
    const json = await result.json();
    return json.data;
};
